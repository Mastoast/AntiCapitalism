extends Node2D

signal started

func _ready():
	StaticMusic.new_beat.connect(_on_new_beat)

func _process(delta):
	pass

func start():
	$AnimationPlayer.play("start")

func stop():
	$AnimationPlayer.play("RESET")

func _on_new_beat():
	if StaticMusic.beat_count % 4 == 0: # trigger every 4 beat
		if $AnimationPlayer.current_animation == "start":
			$AnimationPlayer.play("move")
			started.emit()
