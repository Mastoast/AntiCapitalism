extends Node

var level1 = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"combo_bar_start": 30.0, "combo_decrease_speed" : 5.0,
	"threshold_survival_time" : 5.0, "combo_threshold" : 20.0,
	"briefs" : [
	"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]""",
	"""[font_size=44][center]🎃 COQUELICOT 🎃[/center][/font_size]"""
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
	"combo_bar_start": 30.0, "combo_decrease_speed" : 5.0,
	"threshold_survival_time" : 5.0, "combo_threshold" : 20.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 2.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 5.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern2},
	{"distance": 6.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern2},
	{"distance": 6.5, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern2},
]}

var level3 = {
	"music": StaticMusic.music1, "pitch": 1.1,
	"combo_bar_start": 30.0, "combo_decrease_speed" : 1.0,
	"threshold_survival_time" : 5.0, "combo_threshold" : 10.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern4},
	{"distance": 0.5, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern4}
]}

var capitalism_levels = [level1, level2]
# Otchoz levels

var level2d = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"patterns": [Pattern.pattern1, Pattern.pattern2],
	"trash_count": 2
}

var otchoz_levels = [level2d]
