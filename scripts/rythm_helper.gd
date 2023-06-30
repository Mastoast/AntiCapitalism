extends Sprite2D

@export var scale_multipliyer = 1.0

func _ready():
	pass


func _process(delta):
	var new_scale = 1 - (StaticMusic.beat_length - StaticMusic.get_delay_with_next_beat()) / StaticMusic.beat_length
	new_scale = 0.5 + new_scale * 0.5
	self.scale = Vector2.ONE * new_scale * scale_multipliyer

