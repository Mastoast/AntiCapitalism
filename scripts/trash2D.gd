extends Node2D

var pattern
var is_empty = false

func init(pattern):
	self.pattern = pattern

func _ready():
	pass

func _process(delta):
	pass

func get_pattern():
	return pattern

func empty():
	$Area2D/CollisionShape2D.disabled = true
