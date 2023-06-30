extends Node

const old_container := preload("res://sprites/Cap/OldContainer.png")
const container_texture := preload("res://sprites/Cap/Container.png")
const big_container_texture := preload("res://sprites/Cap/BigContainer.png")
const trash_bag_texture := preload("res://sprites/Cap/TrashBag.png")
const trash_bag_pine := preload("res://sprites/Cap/TrashPile.png")
const open_trash_bag_texture := preload("res://sprites/Cap/OpenTrashBag.png")

var level1 = {
	"music": StaticMusic.music_cap100, "pitch": 1.0,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 20.0,
	"briefs" : [
	"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 1.0, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 1.5, "sprite": open_trash_bag_texture, "pattern": Pattern.pattern2},
	{"distance": 1.75, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 2.25, "sprite": open_trash_bag_texture, "pattern": Pattern.pattern2},
]}

var level2 = {
	"music": StaticMusic.music_cap100, "pitch": 1.1,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 40.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM

Night {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 1.0, "sprite": container_texture, "pattern": Pattern.pattern3},
	{"distance": 1.5, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 1.75, "sprite": open_trash_bag_texture, "pattern": Pattern.pattern2},
	{"distance": 2.0, "sprite": old_container, "pattern": Pattern.pattern4},
]}

var level3 = {
	"music": StaticMusic.music_cap100, "pitch": 1.2,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 0.75, "sprite": open_trash_bag_texture, "pattern": Pattern.pattern2},
	{"distance": 1.25, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 1.75, "sprite": container_texture, "pattern": Pattern.pattern3},
	{"distance": 2.0, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 2.25, "sprite": trash_bag_texture, "pattern": Pattern.pattern1},
	{"distance": 3.0, "sprite": old_container, "pattern": Pattern.pattern4},
]}

var level4 = {
	"music": StaticMusic.music_cap100, "pitch": 1.2,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 0.75, "sprite": container_texture, "pattern": Pattern.pattern3},
	{"distance": 1.25, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 1.5, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 2.25, "sprite": open_trash_bag_texture, "pattern": Pattern.pattern2},
	{"distance": 3.0, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 3.25, "sprite": big_container_texture, "pattern": Pattern.pattern6},
]}
var level5 = {
	"music": StaticMusic.music_cap100, "pitch": 1.2,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 60.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 0.75, "sprite": big_container_texture, "pattern": Pattern.pattern6},
	{"distance": 1.25, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 1.75, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 2.0, "sprite": big_container_texture, "pattern": Pattern.pattern6},
	{"distance": 2.25, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 3.0, "sprite": big_container_texture, "pattern": Pattern.pattern6},
]}

var level6 = {
	"music": StaticMusic.music_cap100, "pitch": 1.4,
	"combo_bar_start": 100.0, "combo_decrease_speed" : 1.2,
	"threshold_survival_time" : 3.0, "combo_threshold" : 80.0,
	"briefs" : [
		"""[font_size=44][center]02:00 AM\n\nNight {night_count}[/center][/font_size]"""
	],
	"trashes" : [
	{"distance": 0.5, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 0.75, "sprite": big_container_texture, "pattern": Pattern.pattern6},
	{"distance": 1.25, "sprite": old_container, "pattern": Pattern.pattern4},
	{"distance": 1.75, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 2.0, "sprite": big_container_texture, "pattern": Pattern.pattern6},
	{"distance": 2.25, "sprite": trash_bag_pine, "pattern": Pattern.pattern5},
	{"distance": 3.0, "sprite": big_container_texture, "pattern": Pattern.pattern6},
]}
var capitalism_levels = [level1, level2, level3, level4, level5, level6]
# Otchoz levels

var level2d = {
	"music": StaticMusic.music_cap100, "pitch": 1.0,
	"briefs" : [
		"""[font_size=44][center]And a new day begins[/center][/font_size]"""
	],
	"patterns": [Pattern.pattern1, Pattern.pattern2, Pattern.pattern3, Pattern.pattern4, Pattern.pattern5],
	"trash_count_at_start": 10, "max_trash" : 12, "trash_count" : 3
}

var otchoz_levels = [level2d]
