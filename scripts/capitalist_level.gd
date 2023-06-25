extends Node3D

@export_category("Game feel")
@export var truck_speed = 3.0
@export var trash_pickup_distance = 1.0
@export var music_pitch = 1.0

@export_category("Combo")
@export var combo_bar_decrease_speed = 5.0
@export var threshold_survival_time = 5.0
@export var combo_point_qte_success = 10.0
@export var combo_point_pattern_success = 20.0
@export var combo_point_qte_failure = -5.0
@export var combo_point_trash_missed = -3.0


@export_category("Scoring")


var trash_can = load("res://objects/trash_can.tscn")

var previous_time = 0.0
var distance := 0.0
var score = 0
var combo = 20.0
var combo_min_value = 0.0
var combo_max_value = 100.0

var is_truck_moving
var in_pattern = false
var starting_pattern = false
var pickable_trash

var max_trash_distance = 20.0
var min_trash_distance = -3.0
var trash_cans = []

var combo_threshold = 15.0
var level1 = [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 2.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 5.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern3},
	{"distance": 6.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern4},
	{"distance": 6.5, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern5},
]

var pattern_player: PatternPlayer  

func _ready():
	randomize()
	StaticMusic.play(StaticMusic.music1, music_pitch)
	StaticMusic.new_beat.connect(_on_new_beat)
	$truck.started.connect(_on_truck_start)
	load_level(level1)
	$SurvivalTimer.wait_time = threshold_survival_time
	setup_combo_threshold()
	pattern_player = $PatternPlayer
	$truck.start()
	pattern_player.pattern_succeeded.connect(_on_pattern_success)
	pattern_player.pattern_failed.connect(_on_pattern_failure)
	pattern_player.qte_succeeded.connect(_on_qte_success)


func _process(delta):
	var current_time = StaticMusic.get_player_total_position()
	var music_delta = current_time - previous_time
	add_combo( -combo_bar_decrease_speed * music_delta)
	#
	if is_truck_moving:
		distance += truck_speed * music_delta
		update_trash_cans()
	$Road.offset.y = -int(distance * 20.0) % $Road.texture.get_height()
	#
	$UI/ScoreText.text = str(int(score))
	$UI/ComboBar.value = combo
	$UI/PickUpInstruction.visible = pickable_trash and not in_pattern
	$UI/debug_distance.text = "distance : " + str(distance)
	previous_time = current_time

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("input_begin"):
		try_start_pattern()

func try_start_pattern():
	if is_truck_moving:
		is_truck_moving = false
		if pickable_trash and !pickable_trash.is_empty:
			$truck.stop()
			in_pattern = true
			starting_pattern = true
		else:
			$truck.start()

func load_level(level):
	for item in level:
		var trash = trash_can.instantiate()
		trash.init(item["distance"], item["pattern"], item["sprite"])
		trash.position.x = $Marker3D.position.x
		trash.position.y = $Marker3D.position.y
		trash_cans.append(trash)
		add_child(trash)
	update_trash_cans()

func setup_combo_threshold():
	var combo_y_position = $UI/ComboBar.get_global_rect().position.y + $UI/ComboBar.get_global_rect().size.y/2
	var threshold_x_position = $UI/ComboBar.get_global_rect().position.x + $UI/ComboBar.get_global_rect().size.x * combo_threshold / combo_max_value
	$comb_threshold.position = Vector2(threshold_x_position, combo_y_position)

func update_trash_cans():
	var pickable = false
	for trash in trash_cans:
		var truck_distance = trash.distance - self.distance
		if truck_distance < min_trash_distance:
			trash_cans.remove_at(trash_cans.bsearch(trash)) 
			trash.queue_free()
			continue
		# position
		trash.position.z = $Marker3D.position.z - truck_distance
		if not trash.is_empty and absf(truck_distance) < trash_pickup_distance:
			pickable = true
			pickable_trash = trash
	# missed trash
	if not pickable and pickable_trash and not pickable_trash.is_empty:
		_on_missed_trash()

func _on_new_beat():
	if StaticMusic.beat_count % 2 == 0: # trigger every 2 beat
		if starting_pattern:
			$PatternPlayer.start_pattern(pickable_trash.pattern)
			starting_pattern = false

func add_combo(value):
	var new_combo = clampf(combo + value, combo_min_value, combo_max_value)
	if new_combo < combo_threshold and combo >= combo_threshold:
		$SurvivalTimer.start()
	if new_combo >= combo_threshold and combo < combo_threshold:
		$SurvivalTimer.stop()
	combo = new_combo

func _on_pattern_success():
	pickable_trash.is_empty = true
	pickable_trash = null
	score += 50
	add_combo(combo_point_pattern_success)
	in_pattern = false
	$truck.start()

func _on_pattern_failure():
	pickable_trash.is_empty = true
	pickable_trash = null
	in_pattern = false
	$truck.start()
	add_combo(combo_point_qte_failure)

func _on_qte_success(precision:float):
	score += 10 * (1.0 - precision)
	add_combo(combo_point_qte_success * (1.0 - precision))

func _on_missed_trash():
	pickable_trash = false
	add_combo(combo_point_trash_missed)

func _on_truck_start():
	is_truck_moving = true

func _on_survival_timer_timeout():
	print("GAME OVER")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
