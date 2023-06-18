extends Node

var player:AudioStreamPlayer
var playerName = "audio_player"

var music1 = { "stream": load("res://sounds/drums_test.wav"), "bpm": 100.0}
var music2 = { "stream": load("res://sounds/ChildrenOfTheRuins.wav"), "bpm": 78.0}

var current_music
var beat_length

var time_begin
var last_time
var last_player_position

var loop_count
var beat_count

func _ready():
	player = AudioStreamPlayer.new()
	player.name = playerName

func _process(delta):
	if player.playing:
		if player.get_playback_position() < last_player_position:
			loop_count += 1
			print("LOOP: ", loop_count)
		if get_player_total_position() > get_next_beat_time():
			beat_count += 1
			print("BEAT: ", beat_count)
		last_player_position = player.get_playback_position()
		last_time = Time.get_ticks_usec()

func play(music, pitch = 1.0, position = 0.0):
	if !player.is_inside_tree():
		get_tree().current_scene.add_child(player)
	loop_count = 0
	beat_count = 0
	last_player_position = 0
	time_begin = Time.get_ticks_usec()
	last_time = time_begin
	current_music = music
	beat_length = 60 / music["bpm"]
	player.stream = music["stream"]
	player.pitch_scale = pitch
	player.play(position)

func stop():
	player.stop()

func get_player_total_position():
	return player.stream.get_length() * loop_count + player.get_playback_position()

func get_next_beat_time():
	return beat_count * beat_length + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()

func get_delay_with_next_beat():
	return get_next_beat_time() - get_player_total_position()

func get_delay_with_previous_beat():
	return beat_length - get_delay_with_next_beat()
