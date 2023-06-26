extends Node2D

var pattern
var is_empty = false
var coords:Vector2i


func init(pattern, coords):
	self.pattern = pattern
	self.coords = coords

func _ready():
	pass

func _process(delta):
	pass

func get_pattern():
	return pattern

func empty():
	$Area2D/CollisionShape2D.disabled = true
