extends Node2D


func _ready():
	pass

func _process(delta):
	pass

func drive():
	$AnimationPlayer.play("move")

func stop():
	$AnimationPlayer.play("RESET")
