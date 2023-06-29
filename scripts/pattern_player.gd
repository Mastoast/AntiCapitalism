class_name PatternPlayer extends Node2D

signal pattern_failed
signal pattern_succeeded
signal on_new_qte
signal qte_succeeded
signal pattern_next_anim

const qte := preload("res://objects/qte.tscn")
const line := preload("res://objects/line.tscn")
const arrow_texture := preload("res://sprites/direction_arrow.png")
const e_texture := preload("res://sprites/e_action.png")

var expected_actions = {
	"input_left" : Vector2.LEFT,
	"input_right" : Vector2.RIGHT,
	"input_up" : Vector2.UP,
	"input_down" : Vector2.DOWN,
	"input_action" : Vector2.ZERO
}

var buffer_qte = []
var pattern_start
var pattern_end
var line_length
var last_qte
var qte_count = 0
var current_pattern_line_center
var nb_fail_accepted
var pattern_drawing_center

# drawing pattern
@export var line_beat_length = 50.0
@export var joint_sprite_scale = Vector2.ONE
@onready var pattern_line:Line2D = $Node2D/PatternLine

#func _ready():
#	# DEBUG
#	StaticMusic.play(StaticMusic.music_cap1, 1.0)
#	start_pattern(Pattern.pattern1, Vector2(300, 300))
#	# DEBUG

func start_pattern(pattern, drawing_center = Vector2(0, 0)):
	qte_count = 0
	last_qte = null
	nb_fail_accepted = pattern["nb_fail_accepted"]
	print("nb fail accepted : " + str(nb_fail_accepted))
	buffer_qte = pattern["pattern"].duplicate(true)
	pattern_start = StaticMusic.get_player_total_position()
	pattern_drawing_center = drawing_center
	if pattern_drawing_center != Vector2.ZERO:
		create_pattern_drawing()
	sort_qte()

func sort_qte():
	var cummul = 0.0;
	for n in buffer_qte:
		print(n)
		cummul += n["delay"]
		n["delay"] = cummul - n["timer"]
	buffer_qte.sort_custom(func(a,b): return a["delay"] < b["delay"])	

func stop_current_pattern():
	qte_count = 0
	for qte in get_tree().get_nodes_in_group("qte"):
		qte.canceled()
	buffer_qte.clear()
	pattern_line.visible = false

func _process(delta):
	spawn_qte_on_time()
	if pattern_drawing_center != Vector2.ZERO:
		update_pattern_drawing()

func _input(event):
	if qte_count == 0 or !event.is_action_type() or !is_expected_action(event):
		return
	var min_time = 99999
	var selected_qte
	for qte in get_tree().get_nodes_in_group("qte"):
		if qte.is_finished : continue
		
		if event.is_action_pressed(qte.expected_action) and qte.is_input_valid():
			selected_qte = qte
			break
		
		if (qte.timer - qte.counter < min_time):
			selected_qte = qte
			min_time = qte.timer - qte.counter

	if selected_qte:
		var result = selected_qte.try_input(event, nb_fail_accepted <= 0)
		if !result : 
			nb_fail_accepted -= 1
			print("fail accepted")
	else:
		_on_bad_input()

func spawn_qte_on_time():
	if !buffer_qte.is_empty():
		if StaticMusic.get_player_total_position() >= pattern_start + buffer_qte[0]["delay"] * StaticMusic.beat_length:
			
			on_new_qte.emit(buffer_qte[0])
			
			var new_qte = spawn_qte(buffer_qte[0], StaticMusic.beat_length * buffer_qte[0]["timer"], buffer_qte[0]["position"], buffer_qte[0]["input"])
			if pattern_drawing_center == Vector2.ZERO:
				if last_qte != null && buffer_qte[0].has("draw_line") && buffer_qte[0]["draw_line"] :
					spawn_line(last_qte, new_qte)

				if buffer_qte[0].has("draw_line"):
					last_qte = new_qte
			else:
				new_qte.visible = false
			buffer_qte.pop_front()

func spawn_qte(data, timer, position, input):
	var new_qte = qte.instantiate()
	new_qte.init(data, timer, input)
	new_qte.position = Vector2(position.x * ProjectSettings.get_setting("display/window/size/viewport_width") / 1920.0,
							   position.y * ProjectSettings.get_setting("display/window/size/viewport_height") / 1080.0)
	
	new_qte.qte_succeed.connect(_on_qte_success)
	new_qte.qte_failed.connect(_on_qte_failure)
	
	add_child(new_qte)
	qte_count += 1
	return new_qte

func spawn_line(qteA, qteB):
	if qteA == null || qteB == null :
		return
	
	var new_line = line.instantiate()
	new_line.init(qteA, qteB, pattern_succeeded, pattern_failed)
	new_line.position = Vector2.ZERO
	add_child(new_line)
	
func is_expected_action(event):
	for action in expected_actions.keys():
		if event.is_action_pressed(action):
			return true
	return false

func _on_qte_success(data, precision:float):
	qte_succeeded.emit(precision)
	if data.has("anim_sprite"):
		pattern_next_anim.emit(data["anim_sprite"])
	qte_count -= 1
	if buffer_qte.is_empty() and qte_count == 0:
		pattern_line.visible = false
		pattern_succeeded.emit()

func _on_qte_failure(data, precision:float):
	stop_current_pattern()
	pattern_failed.emit()

func _on_bad_input():
	stop_current_pattern()
	pattern_failed.emit()

func create_pattern_drawing():
	pattern_line.clear_points()
	pattern_line.visible = true
	for point in pattern_line.get_children():
		pattern_line.remove_child(point)
		point.queue_free()
	var last_direction = Vector2.ZERO
	pattern_line.add_point(Vector2.ZERO)
	var last_position = pattern_line.get_point_position(pattern_line.get_point_count()-1) + expected_actions[buffer_qte[0]["input"]] * line_beat_length * buffer_qte[0]["delay"]
	pattern_line.add_point(last_position)
	line_length = Vector2.ZERO.distance_to(last_position)
	var pattern_length = 0
	for i in range(buffer_qte.size()):
		pattern_length += buffer_qte[i]["delay"]
		var used_direction
		var new_vector
		if expected_actions[buffer_qte[i]["input"]] == Vector2.ZERO:
			used_direction = expected_actions["input_left"]
		else:
			used_direction = expected_actions[buffer_qte[i]["input"]]
			last_direction = used_direction
		if i != buffer_qte.size()-1:
			new_vector = buffer_qte[i + 1]["delay"] * used_direction * line_beat_length
		else:
			new_vector = buffer_qte[i]["delay"] * used_direction * line_beat_length
		var new_position = last_position + new_vector
		if i < buffer_qte.size()-1:
			line_length += last_position.distance_to(new_position)
		pattern_line.add_point(new_position)
		create_line_joint(buffer_qte[i]["input"], last_position)
		last_position = new_position
	pattern_end = pattern_start + pattern_length * StaticMusic.beat_length

func create_line_joint(input, position):
	var new_sprite = Sprite2D.new()
	var new_qte = qte.instantiate()
	if input == "input_action":
		new_sprite.texture = e_texture
	else:
		new_sprite.texture = arrow_texture
		if input == "input_up" :
			new_sprite.modulate = new_qte.up_color
		elif input == "input_down" :
			new_sprite.modulate = new_qte.down_color
		elif input == "input_left" :
			new_sprite.modulate = new_qte.left_color
		elif input == "input_right" :
			new_sprite.modulate = new_qte.right_color
	new_sprite.rotation_degrees = new_qte.sprite_dict[input]["rotation"]
	new_sprite.scale = joint_sprite_scale
	pattern_line.add_child(new_sprite)
	new_sprite.position = position

func update_pattern_drawing():
	if !buffer_qte.is_empty() or qte_count > 0:
		var pattern_ratio = minf(1.1, (StaticMusic.get_player_total_position() - pattern_start) / (pattern_end - pattern_start))
		var new_position = pattern_drawing_center + get_position_on_line_from_ratio(pattern_ratio)
		if new_position:
			pattern_line.position = new_position

func get_position_on_line_from_ratio(ratio):
	var current_length = line_length * ratio
	var incr_length = 0.0
	for i in range(1, pattern_line.get_point_count()):
		var current_segment_length = pattern_line.get_point_position(i-1).distance_to(pattern_line.get_point_position(i))
		if incr_length + current_segment_length >= current_length:
			return -lerp(pattern_line.get_point_position(i-1), pattern_line.get_point_position(i), (current_length - incr_length) / current_segment_length)
		else:
			incr_length += current_segment_length
