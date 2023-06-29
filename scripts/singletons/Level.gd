extends Node

var level1 = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 20.0,
	"briefs" : [
	"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 1.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern1},
	{"distance": 1.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 1.75, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern1},
	{"distance": 2.25, "sprite": Color.DARK_RED, "pattern": Pattern.pattern2},
]}

var level2 = {
	"music": StaticMusic.music1, "pitch": 1.1,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 40.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 1.0, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern3},
	{"distance": 1.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern1},
	{"distance": 1.75, "sprite": Color.BLUE_VIOLET, "pattern": Pattern.pattern2},
	{"distance": 2.0, "sprite": Color.DARK_GREEN, "pattern": Pattern.pattern4},
]}

var level3 = {
	"music": StaticMusic.music1, "pitch": 1.2,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern4},
	{"distance": 0.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 1.25, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern1},
	{"distance": 1.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern3},
	{"distance": 2.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern4},
	{"distance": 2.25, "sprite": Color.DARK_RED, "pattern": Pattern.pattern1},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern4},
]}

var level4 = {
	"music": StaticMusic.music1, "pitch": 1.2,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern4},
	{"distance": 0.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern3},
	{"distance": 1.25, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern4},
	{"distance": 1.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern5},
	{"distance": 2.25, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": Color.DARK_RED, "pattern": Pattern.pattern4},
	{"distance": 3.25, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
]}
var level5 = {
	"music": StaticMusic.music1, "pitch": 1.2,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern5},
	{"distance": 0.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
	{"distance": 1.25, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern4},
	{"distance": 1.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern5},
	{"distance": 2.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
	{"distance": 2.25, "sprite": Color.DARK_RED, "pattern": Pattern.pattern5},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
]}

var level6 = {
	"music": StaticMusic.music1, "pitch": 1.4,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 80.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern5},
	{"distance": 0.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
	{"distance": 1.25, "sprite": Color.MIDNIGHT_BLUE, "pattern": Pattern.pattern4},
	{"distance": 1.75, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern5},
	{"distance": 2.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
	{"distance": 2.25, "sprite": Color.DARK_RED, "pattern": Pattern.pattern5},
	{"distance": 3.0, "sprite": Color.GREEN_YELLOW, "pattern": Pattern.pattern6},
]}
var capitalism_levels = [level1, level2, level3, level4, level5, level6]
# Otchoz levels

var level2d = {
	"music": StaticMusic.music1, "pitch": 1.0,
	"briefs" : [
		"""[font_size=44][center]And a new day begins[/center][/font_size]"""
	],
	"patterns": [Pattern.pattern1, Pattern.pattern2, Pattern.pattern5],
	"trash_count": 3
}

var otchoz_levels = [level2d]
