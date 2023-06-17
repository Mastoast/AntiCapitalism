extends Node2D

const qte := preload("res://objects/qte.tscn")
var inputs = ["ui_left", "ui_right", "ui_up", "ui_down"]

func _ready():
	randomize()

func _process(delta):
	if get_child_count() < 2:
		spawn_qte(randf_range(0.5, 1.2), Vector2(200, 200))

func spawn_qte(timer, position):
	var new_qte = qte.instantiate()
	new_qte.init(timer, inputs.pick_random())
	new_qte.position = position
	add_child(new_qte)
