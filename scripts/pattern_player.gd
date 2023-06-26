class_name PatternPlayer extends Node2D

signal pattern_failed
signal pattern_succeeded
signal qte_succeeded

const qte := preload("res://objects/qte.tscn")
const line := preload("res://objects/line.tscn")

var expected_actions = [
	"input_left",
	"input_right",
	"input_up",
	"input_down",
	"input_action"
]

var buffer_qte = []
var pattern_start
var last_pos
var last_qte
var qte_count = 0

#func _ready():
#	# DEBUG
#	StaticMusic.play(StaticMusic.music1, 1.0)
#	start_pattern(Pattern.pattern1)
#	# DEBUG

func start_pattern(pattern):
	qte_count = 0
	buffer_qte = pattern.duplicate(true)	
	sort_qte()			
	last_qte = null
	pattern_start = StaticMusic.get_player_total_position()

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
		qte.queue_free()
	buffer_qte.clear()

func _process(delta):
	spawn_qte_on_time()

func _input(event):
	if qte_count == 0 or !event.is_action_type() or !is_expected_action(event):
		return
	var min_time = 99999
	var selected_qte
	for qte in get_tree().get_nodes_in_group("qte"):
		if event.is_action_pressed(qte.expected_action) and (qte.timer - qte.counter < min_time):
			min_time = qte.timer - qte.counter
			selected_qte = qte
	if selected_qte:
		selected_qte.try_input(event)
	else:
		_on_bad_input()

func spawn_qte_on_time():
	if !buffer_qte.is_empty():
		if StaticMusic.get_player_total_position() >= pattern_start + buffer_qte[0]["delay"] * StaticMusic.beat_length:
			if last_qte != null && buffer_qte[0]["draw_line"] :
				spawn_line(last_qte, buffer_qte[0])
			spawn_qte(StaticMusic.beat_length * buffer_qte[0]["timer"], buffer_qte[0]["position"], buffer_qte[0]["input"])
			
			last_qte = buffer_qte[0]
			buffer_qte.pop_front()

func spawn_qte(timer, position, input):
	var new_qte = qte.instantiate()
	new_qte.init(timer, input)
	new_qte.position = Vector2(position.x * ProjectSettings.get_setting("display/window/size/viewport_width") / 1920.0,
							   position.y * ProjectSettings.get_setting("display/window/size/viewport_height") / 1080.0)
	new_qte.qte_succeed.connect(_on_qte_success)
	new_qte.qte_failed.connect(_on_qte_failure)
	add_child(new_qte)
	qte_count += 1

func spawn_line(qteA, qteB):
	if pattern_start + qteA["timer"] + qteA["delay"] < StaticMusic.get_player_total_position() :
		return
	var new_line = line.instantiate()
	var duration = StaticMusic.beat_length * (qteA["timer"] + qteA["delay"]) + pattern_start - StaticMusic.get_player_total_position();
	new_line.init(qteA.position, qteB.position, duration)
	new_line.position = Vector2.ZERO
	add_child(new_line)
	
func is_expected_action(event):
	for action in expected_actions:
		if event.is_action_pressed(action):
			return true
	return false

func _on_qte_success(precision:float):
	qte_succeeded.emit(precision)
	qte_count -= 1
	if buffer_qte.is_empty() and qte_count == 0:
		pattern_succeeded.emit()

func _on_qte_failure(precision:float):
	stop_current_pattern()
	pattern_failed.emit()

func _on_bad_input():
	stop_current_pattern()
	pattern_failed.emit()
