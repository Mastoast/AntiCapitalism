extends Node

var bowup = load("res://sounds/boing.wav")

var audio_players = []

func _ready():
	pass

func _process(delta):
	for player in audio_players:
		if !player.playing:
			player.queue_free()
			audio_players.erase(player)

func play_sfx(stream, pitch = 1.0, position = 0.0):
	var player = AudioStreamPlayer.new()
	player.bus = "Sfx"
	player.stream = stream
	player.pitch_scale = pitch
	get_tree().current_scene.add_child(player)
	player.play(position)
	audio_players.append(player)
