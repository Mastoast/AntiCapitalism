extends Node2D

@export var player_movement_time = 0.1

func _ready():
	pass

func _process(delta):
	pass

func move(direction):
	pass

func try_move(move, grid_size):
	$RayCast2D.target_position = move * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() :
		var tween = create_tween()
		var prop = tween.tween_property(self, "position", move * grid_size, player_movement_time)
		prop.as_relative().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
		if move.x > 0.0: $Sprite2D/Anim.play("move_right")
		elif move.x < 0.0: $Sprite2D/Anim.play("move_left")
		elif move.y > 0.0: $Sprite2D/Anim.play("move_down")
		elif move.y < 0.0: $Sprite2D/Anim.play("move_up")
