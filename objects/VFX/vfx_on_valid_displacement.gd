extends Node2D

func init(position, sprite):
	global_position = position
	$Sprite2D.texture = sprite
	$Anim.play("play")

func _process(delta):
	if $Timer.is_stopped() :
		queue_free()
