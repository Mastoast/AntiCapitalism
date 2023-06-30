extends Node3D

@export_category("Game feel")
@export var truck_speed = 3.0
@export var trash_pickup_distance = 1.0
@export var road_speed = 20.0

@export_category("Combo")
@export var combo_point_qte_success = 10.0
@export var combo_point_pattern_success = 20.0
@export var combo_point_qte_failure = -5.0
@export var combo_point_trash_missed = -3.0

var trash_can = load("res://objects/trash_can.tscn")

var previous_time = 0.0
var distance := 0.0
var score = 0
var combo = 20.0
var combo_min_value = 0.0
var combo_max_value = 100.0
var combo_decrease_speed

var is_truck_moving
var in_pattern = false
var starting_pattern = false
var level_ending = false
var pickable_trash

@export var max_trash_distance = 20.0
@export var min_trash_distance = -3.0
var trash_cans = []
var near_trash = false

var waiting_timer_texts = ["GO", "3", "2", "1"]
var combo_threshold

var pattern_player: PatternPlayer  

func _ready():
	var current_level = Level.capitalism_levels[ProgressData.capitalism_level_count]
	StaticMusic.play(current_level["music"], current_level["pitch"])
	StaticMusic.new_beat.connect(_on_new_beat)
	$truck.started.connect(_on_truck_start)
	$truck.waiting.connect(_on_waiting_beat)
	load_level(current_level)
	setup_combo_threshold()
	pattern_player = $PatternPlayer
	$truck.start()
	pattern_player.pattern_succeeded.connect(_on_pattern_success)
	pattern_player.pattern_failed.connect(_on_pattern_failure)
	pattern_player.qte_succeeded.connect(_on_qte_success)
	pattern_player.pattern_next_anim.connect(_on_next_anim)
	$UI/TransitionLayer.wake_transition(func(): pass)

func _process(delta):
	var current_time = StaticMusic.get_player_total_position()
	var music_delta = current_time - previous_time
	add_combo( -combo_decrease_speed * music_delta)
	#
	if is_truck_moving:
		distance += truck_speed * music_delta
		update_trash_cans()
	$Road.offset.y = -int(distance * road_speed) % $Road.texture.get_height()
	#
	$UI/ScoreText.text = str(int(score))
	$UI/ComboBar.value = combo

	#$PickUpBar.visible = pickable_trash and not in_pattern

	if $SurvivalTimer.is_stopped() :
		$UI/SurvivalTimerText.text = ""
	else :
		$UI/SurvivalTimerText.text = str($SurvivalTimer.time_left).pad_decimals(1)
	
	previous_time = current_time
	# Win condition
	if trash_cans.is_empty() and not level_ending:
		$truck.end()
		level_ending = true
		win_level()

func _input(event):
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	if event.is_action_pressed("input_begin"):
		try_start_pattern()

func try_start_pattern():
	if is_truck_moving:
		is_truck_moving = false
		if pickable_trash and !pickable_trash.is_empty:
			_on_success_trash()
			$truck.stop()
			in_pattern = true
			starting_pattern = true
		else:
			$truck.start()

func load_level(level):
	combo = level["combo_bar_start"]
	combo_decrease_speed = level["combo_decrease_speed"]
	$SurvivalTimer.wait_time = level["threshold_survival_time"]
	combo_threshold = level["combo_threshold"]
	for item in level["trashes"]:
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
			trash_cans.erase(trash)
			trash.queue_free()
			continue
		trash.position.z = $Marker3D.position.z - truck_distance
		if not trash.is_empty and absf(truck_distance) < trash_pickup_distance:
			pickable = true
			pickable_trash = trash
			if !near_trash: _on_near_trash()
		if not trash.is_empty and truck_distance < -trash_pickup_distance:
			trash.is_empty = true
			if pickable_trash == trash:
				pickable_trash = null
			_on_missed_trash()

func _on_new_beat():
	if StaticMusic.beat_count % 2 == 0: # trigger every 2 beat
		if starting_pattern:
			$PatternPlayer.start_pattern(pickable_trash.pattern)
			if pickable_trash.pattern.has("anim_sprite"):
				_on_next_anim(pickable_trash.pattern["anim_sprite"])
			starting_pattern = false

func _on_next_anim(anim_sprite):
	if pickable_trash :	pickable_trash.hide()
	$truck.set_anim(anim_sprite)

func add_combo(value):
	var new_combo = clampf(combo + value, combo_min_value, combo_max_value)
	if new_combo < combo_threshold and $SurvivalTimer.is_stopped() and not level_ending:
		$SurvivalTimer.start()
	if new_combo >= combo_threshold and not $SurvivalTimer.is_stopped():
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
	#pickable_trash = null
	in_pattern = false
	$truck.start()
	add_combo(combo_point_qte_failure)

func _on_qte_success(precision:float):
	score += 10 * (1.0 - precision)
	add_combo(combo_point_qte_success * (1.0 - precision))

func _on_near_trash():
	$PickUpBar/Anim.play("appear")
	near_trash = true

func _on_success_trash():
	$PickUpBar/Anim.play("success")
	near_trash = false

func _on_missed_trash():
	add_combo(combo_point_trash_missed)
	$PickUpBar/Anim.play("failed")
	near_trash = false

func _on_truck_start():
	if pickable_trash : pickable_trash.show()
	is_truck_moving = true

func _on_survival_timer_timeout():
	level_ending = true
	ProgressData.is_otchoz = true
	$UI/TransitionLayer.sleep_transition(func(): get_tree().change_scene_to_file("res://scenes/briefing.tscn"))
	
func win_level():
	ProgressData.setup_next_level()
	$UI/TransitionLayer.sleep_transition(func(): get_tree().change_scene_to_file("res://scenes/briefing.tscn"))

func _on_waiting_beat(beat_diff):
	$UI/WaitingTimerText.text = waiting_timer_texts[beat_diff]
	$UI/WaitingTimerText.visible = true
	$WaitingTimer.start()

func _on_waiting_timer_timeout():
	$UI/WaitingTimerText.visible = false
