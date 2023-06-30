extends Node

var bowup = load("res://sounds/boing.wav")
var intro = load("res://sounds/intro.mp3")
var outro = load("res://sounds/outro.mp3")
var shaker = load("res://sounds/shaker.mp3")
var error = load("res://sounds/error.mp3")
var hihat = load("res://sounds/hihat.mp3")

var audio_players = []

func _ready():
	pass

func _process(delta):
	for player in audio_players:
		if player and !player.playing:
			player.queue_free()
			audio_players.erase(player)

func play_sfx(stream, pitch = 1.0, position = 0.0, volume = 0.0):
	var player = AudioStreamPlayer.new()
	player.bus = "Sfx"
	player.stream = stream
	player.pitch_scale = pitch
	player.volume_db = volume
	get_tree().current_scene.add_child(player)
	player.play(position)
	audio_players.append(player)
