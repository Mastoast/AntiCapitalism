extends Node2D

@export var combo_decrease_speed = 5.0
@export var truck_speed = 1.0
@export var trash_can = load("res://objects/trash_can.tscn")
@export var pickup_distance = 1.0

var previous_time = 0.0
var distance = 0.0
var score = 0
var combo = 20.0

var is_truck_moving

var max_trash_distance = 20.0
var min_trash_distance = -3.0
var trash_cans = []
var level1 = [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 5.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern2},
	{"distance": 20.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1}	
]

func _ready():
	randomize()
	StaticMusic.play(StaticMusic.music1, 1.0)
	StaticMusic.new_beat.connect(_on_new_beat)
	load_level(level1)
	is_truck_moving = true
	$truck.drive()


func _process(delta):
	var current_time = StaticMusic.get_player_total_position()
	var music_delta = current_time - previous_time
	combo -= combo_decrease_speed * music_delta
	#
	if is_truck_moving:
		distance += truck_speed * music_delta
		update_trash_cans()
	#
	$UI/ScoreText.text = str(score)
	$UI/ComboBar.value = combo
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
	else:
		is_truck_moving = true
		$truck.drive()
	print(distance)
	print(trash_cans[0].global_position)

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
#		var trash_scale = min(1 / absf(truck_distance), 1.0)
#		trash.scale = Vector2(trash_scale, trash_scale)
#		var ratio = 1 - truck_distance / (max_trash_distance - min_trash_distance)
		# position
		if truck_distance >= 0:
			var ratio = 1 - truck_distance / (max_trash_distance - truck_distance)
			trash.position = $TrashSpawn.position.lerp($TrashInteraction.position, min(max(ratio, 0), 1))
		else:
			var ratio = 1 - truck_distance / (min_trash_distance - truck_distance)
			trash.position = $TrashDespawn.position.lerp($TrashInteraction.position, min(max(ratio, 0), 1))
		#
		if absf(truck_distance) <  pickup_distance:
			pickable = true
	$UI/PickUpInstruction.visible = pickable

func _on_new_beat():
	pass

func _on_qte_success(precision:float):
	score += 10 * (1.0 - precision)

func _on_qte_failure(precision:float):
	score -= 5

func _on_bad_input():
	score -= 3
