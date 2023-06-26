extends Node

var level1 = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.0,
	"threshold_survival_time" : 5.0, "combo_threshold" : 20.0,
	"briefs" : [
	"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]""",
	"""[font_size=44][center]🎃 COQUELICOT 🎃[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 1.5, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern1},
	{"distance": 2.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern1},
	{"distance": 3.5, "sprite": Color.DARK_RED, "pattern": Pattern.pattern1},
	{"distance": 4.5, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern2},
]}

var level2 = {
	"music": StaticMusic.music1, "pitch": 1.1,
	"combo_bar_start": 80.0, "combo_decrease_speed" : 1.0,
	"threshold_survival_time" : 3.0, "combo_threshold" : 40.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 1.5, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern1},
	{"distance": 2.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern2},
	{"distance": 3.5, "sprite": Color.DARK_RED, "pattern": Pattern.pattern1},
	{"distance": 4.5, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern3},
]}

var level3 = {
	"music": StaticMusic.music1, "pitch": 1.2,
	"combo_bar_start": 30.0, "combo_decrease_speed" : 1.0,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 1.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern3},
	{"distance": 2.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern2},
	{"distance": 4.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern3},
	{"distance": 6.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern3},
	{"distance": 6.5, "sprite": Color.DARK_RED, "pattern": Pattern.pattern1},
	{"distance": 7.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern1},
	{"distance": 8.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern3},
]}

var capitalism_levels = [level1, level2, level3]
# Otchoz levels

var level2d = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"patterns": [Pattern.pattern1, Pattern.pattern2],
	"trash_count": 2
}

var otchoz_levels = [level2d]
