extends Node2D

@export var player_movement_time = 0.1

var vfx_on_valid_displacement = load("res://objects/vfx_on_valid_displacement.tscn")

func _ready():
	StaticMusic.new_beat.connect(_start_anim)

func _start_anim():
	if !$Sprite2D/Anim.is_playing():
		$Sprite2D/Anim.play("idle", -1.0, 1.0 / StaticMusic.beat_length, false)

func _process(delta):
	pass

func move(direction):
	pass

func hide_directions():
	$ArrowUp.hide()
	$ArrowLeft.hide()
	$ArrowDown.hide()
	$ArrowRight.hide()

func show_directions(grid_size, is_input_valid):
	var color = Color.WHITE
	if !is_input_valid : color = Color(Color.WHITE, 0.5)
	$RayCast2D.target_position = Vector2.UP * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : 
		$ArrowUp.show()
		$ArrowUp.modulate = color;
	else : $ArrowUp.hide()
	
	$RayCast2D.target_position = Vector2.LEFT * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : 
		$ArrowLeft.show()
		$ArrowLeft.modulate = color;
	else : $ArrowLeft.hide()
	
	$RayCast2D.target_position = Vector2.DOWN * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : 
		$ArrowDown.show()
		$ArrowDown.modulate = color;
	else : $ArrowDown.hide()
	
	$RayCast2D.target_position = Vector2.RIGHT * grid_size
	$RayCast2D.force_raycast_update()
	if !$RayCast2D.is_colliding() : 
		$ArrowRight.show()
		$ArrowRight.modulate = color;
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
		if move.x > 0.0: 
			$Sprite2D/Anim.play("move_right")
		elif move.x < 0.0: 
			$Sprite2D/Anim.play("move_left")
		elif move.y > 0.0: 
			$Sprite2D/Anim.play("move_down")
		elif move.y < 0.0: 
			$Sprite2D/Anim.play("move_up")
		
		_on_valid_displacement(move)

func _on_valid_displacement(direction):
	
	var vfx = vfx_on_valid_displacement.instantiate()
	var dir
	if direction.x > 0.0: 
		dir = $ArrowRight
	elif direction.x < 0.0: 
		dir = $ArrowLeft
	elif direction.y > 0.0: 
		dir = $ArrowDown
	else : 
		dir = $ArrowUp
	
	vfx.init(dir.global_position, dir.texture)
	get_tree().get_root().add_child(vfx)

