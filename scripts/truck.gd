extends Node2D

signal started
signal waiting

func _ready():
	StaticMusic.new_beat.connect(_on_new_beat)

func _process(delta):
	pass

func start():
	$AnimationPlayer.play("start")

func stop():
	$AnimationPlayer.play("RESET")

func end():
	$AnimationPlayer.play("RESET")

func set_anim(anim) :
	$Wheel/TruckBase/Anim.texture = load("res://sprites/Cap/"+anim)
	$Wheel/TruckBase/RollingDude.hide()
	$Wheel/TruckBase/TruckAnimated.hide()
	$Wheel/TruckBase/Anim.show()

func _on_new_beat():
	if StaticMusic.beat_count % 4 == 0: # trigger every 4 beat
		if $AnimationPlayer.current_animation == "start":
			$AnimationPlayer.play("move")
			started.emit()
			waiting.emit(0)
			$Wheel/TruckBase/RollingDude.show()
			$Wheel/TruckBase/TruckAnimated.show()
			$Wheel/TruckBase/Anim.hide()
	if $AnimationPlayer.current_animation == "start":
		waiting.emit(StaticMusic.beat_count % 4)
		StaticSfx.play_sfx(StaticSfx.bowup)
