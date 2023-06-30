extends Node2D

var pattern
var is_empty = false
var coords:Vector2i


func init(pattern, coords):
	self.pattern = pattern
	self.coords = coords
	StaticMusic.new_beat.connect(_start_anim)

func _start_anim():
	StaticMusic.new_beat.disconnect(_start_anim)	
	$Sprite2D/AnimationPlayer.play("beat", -1.0, 1.0 / StaticMusic.beat_length, false)

func _process(delta):
	pass

func get_pattern():
	return pattern

func empty():
	is_empty = true
	$Area2D/CollisionShape2D.disabled = true

func set_sprite(sprite):
	$Sprite2D.texture = sprite
