extends Node2D

@export var player_movement_time = 0.1

func _ready():
	StaticMusic.new_beat.connect(_start_anim)

func _start_anim():
	if !$Sprite2D/Anim.is_playing():
		$Sprite2D/Anim.play("idle", -1.0, 1.0 / StaticMusic.beat_length, false)

func _process(delta):
	pass

func move(direction):
	pass

func show_directions(grid_size):
	$RayCast2D.target_position = Vector2.UP * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : $ArrowUp.show()
	else : $ArrowUp.hide()
	
	$RayCast2D.target_position = Vector2.LEFT * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : $ArrowLeft.show()
	else : $ArrowLeft.hide()
	
	$RayCast2D.target_position = Vector2.DOWN * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : $ArrowDown.show()
	else : $ArrowDown.hide()
	
	$RayCast2D.target_position = Vector2.RIGHT * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : $ArrowRight.show()
	else : $ArrowRight.hide()
	hide_trash();

func show_trash(direction, grid_size):
	pass
#	$Space.show()
#	print(direction)
#	if direction.x > 0.7 : direction = Vector2.RIGHT
#	elif direction.x < -0.7 : direction = Vector2.LEFT
#	elif direction.y > 0.7 : direction = Vector2.DOWN
#	elif direction.y < -0.7 : direction = Vector2.UP
#
#	$Space.position = Vector2.ONE * grid_size/2.0 + direction * grid_size
	
func hide_trash():
	pass
#	$Space.hide()
	

func try_move(move, grid_size):
	$RayCast2D.target_position = move * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() :
		StaticSfx.play_sfx(StaticSfx.bowup, randf_range(0.9, 1.1))
		var tween = create_tween()
		var prop = tween.tween_property(self, "position", move * grid_size, player_movement_time)
		prop.as_relative().set_trans(Tween.TRANS_EXPO).set_ease(Tween.EASE_IN)
		if move.x > 0.0: $Sprite2D/Anim.play("move_right")
		elif move.x < 0.0: $Sprite2D/Anim.play("move_left")
		elif move.y > 0.0: $Sprite2D/Anim.play("move_down")
		elif move.y < 0.0: $Sprite2D/Anim.play("move_up")
