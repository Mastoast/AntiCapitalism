extends Node

var level1 = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night 1[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 2.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern1},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 5.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern1},
	{"distance": 6.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern1},
	{"distance": 6.5, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern1},
]}

var level2 = {
	"music": StaticMusic.music1, "pitch": 1.1,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night 2[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 2.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 5.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern2},
	{"distance": 6.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern2},
	{"distance": 6.5, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern2},
]}

var capitalism_levels = [level1, level2]
# Otchoz levels

var level2d = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"trashes": [
	{"position": Vector2(72, 40), "pattern": Pattern.pattern2}
]}

var otchoz_levels = [level2d]
