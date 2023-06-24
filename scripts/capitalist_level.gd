extends Node2D

@export_category("Game feel")
@export var truck_speed = 3.0
@export var trash_pickup_distance = 1.0
@export var music_pitch = 1.0

@export_category("Scoring")
@export var combo_bar_decrease_speed = 5.0

var trash_can = load("res://objects/trash_can.tscn")

var previous_time = 0.0
var distance = 0.0
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
var level1 = [
	{"distance": 5.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 10.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern2},
	{"distance": 20.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 23.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern3},
	{"distance": 28.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern4},
	{"distance": 28.0, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern5},
]

var pattern_player: PatternPlayer  

func _ready():
	randomize()
	StaticMusic.play(StaticMusic.music1, music_pitch)
	StaticMusic.new_beat.connect(_on_new_beat)
	load_level(level1)
	pattern_player = $PatternPlayer
	is_truck_moving = true
	$truck.drive()
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
		$truck.stop()
		if pickable_trash and !pickable_trash.is_empty:
			in_pattern = true
			starting_pattern = true
			#$PatternPlayer.start_pattern(pickable_trash.pattern)
	elif not in_pattern:
		is_truck_moving = true
		$truck.drive()

func load_level(level):
	for item in level:
		var trash = trash_can.instantiate()
		trash.init(item["distance"], item["pattern"], item["sprite"])
		trash.global_position = $TrashSpawn.position
		trash.hide()
		trash_cans.append(trash)
		add_child(trash)

func update_trash_cans():
	var pickable = false
	for trash in trash_cans:
		var truck_distance = trash.distance - self.distance
		if truck_distance < max_trash_distance:
			trash.show()
		if truck_distance < min_trash_distance:
			trash_cans.remove_at(trash_cans.bsearch(trash)) 
			trash.queue_free()
			continue
		# visual scaling
		var trash_scale = min(1 / absf(truck_distance), 1.0)
		trash.scale = Vector2(trash_scale, trash_scale)
		# position
		if truck_distance >= 0:
			var ratio = 1 - truck_distance / (max_trash_distance - truck_distance)
			trash.position = $TrashSpawn.position.lerp($TrashInteraction.position, clampf(ratio, 0, 1))
		else:
			var ratio = 1 - truck_distance / (min_trash_distance - truck_distance)
			trash.position = $TrashDespawn.position.lerp($TrashInteraction.position, clampf(ratio, 0, 1))
		#
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
	combo = clampf(combo + value, combo_min_value, combo_max_value)

func _on_pattern_success():
	pickable_trash.is_empty = true
	pickable_trash = null
	score += 50
	add_combo(25)
	in_pattern = false
	is_truck_moving = true
	$truck.drive()

func _on_pattern_failure():
	in_pattern = false
	is_truck_moving = true
	$truck.drive()
	add_combo(-5)

func _on_qte_success(precision:float):
	score += 10 * (1.0 - precision)
	add_combo(10 * (1.0 - precision))

func _on_missed_trash():
	pickable_trash = false
	add_combo(-3)
