class_name PatternPlayer extends Node2D

signal pattern_failed
signal pattern_succeeded
signal qte_succeeded

const qte := preload("res://objects/qte.tscn")

var expected_actions = [
	"input_left",
	"input_right",
	"input_up",
	"input_down",
	"input_action"
]

var buffer_qte = []
var pattern_start
var last_pos = Vector2(200, 200)
var qte_count = 0

#func _ready():
#	# DEBUG
#	StaticMusic.play(StaticMusic.music1, 1.0)
#	start_pattern(Pattern.pattern1)
#	# DEBUG

func start_pattern(pattern):
	qte_count = 0
	last_pos = Vector2(200, 200)
	buffer_qte = pattern.duplicate(true)
	pattern_start = StaticMusic.get_player_total_position()

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
		_on_qte_failure()

func spawn_qte_on_time():
	if !buffer_qte.is_empty():
		if StaticMusic.get_player_total_position() >= pattern_start + buffer_qte[0]["delay"] * StaticMusic.beat_length - buffer_qte[0]["timer"] * StaticMusic.beat_length:
			spawn_qte(StaticMusic.beat_length * buffer_qte[0]["timer"], last_pos, buffer_qte[0]["input"])
			last_pos.x = 200 + (int)(last_pos.x + 100) % 800
			buffer_qte.pop_front()

func spawn_qte(timer, position, input):
	var new_qte = qte.instantiate()
	new_qte.init(timer, input)
	new_qte.position = position
	new_qte.qte_succeed.connect(_on_qte_success)
	new_qte.qte_failed.connect(_on_qte_failure)
	add_child(new_qte)
	qte_count += 1

func is_expected_action(event):
	for action in expected_actions:
		if event.is_action_pressed(action):
			return true
	return false

func _on_qte_success(precision:float):
	qte_succeeded.emit(precision)
	print("QTE SUCCEEDED")
	qte_count -= 1
	if buffer_qte.is_empty() and qte_count == 0:
		pattern_succeeded.emit()
		print("PATTERN SUCCEEDED")

func _on_qte_failure():
	stop_current_pattern()
	pattern_failed.emit()
	print("PATTERN FAILED")
