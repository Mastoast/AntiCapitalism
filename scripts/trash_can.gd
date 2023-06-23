extends Node2D

var distance
var pattern
var sprite

func init(distance, pattern, sprite):
	self.distance = distance
	self.pattern = pattern
	self.sprite = sprite
	$Sprite2D.modulate = sprite

func _ready():
	pass

func _process(delta):
	pass
