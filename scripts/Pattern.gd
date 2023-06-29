class_name Pattern extends Node

const pattern1 = { "nb_fail_accepted" : 1, "anim_sprite": "Pat01/Pat01Anim01.png", "pattern" :
[ # difficulty 1 TRASH BAG
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 2.0, 	"anim_sprite":"Pat01/Pat01Anim02.png", "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, 	"anim_sprite":"Pat01/Pat01Anim03.png", "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0,  650.0), "timer": 2.0, 	"anim_sprite":"Pat01/Pat01Anim04.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, 	"anim_sprite":"Pat01/Pat01Anim05.png", "draw_line" : true},
]}

const pattern2 = { "nb_fail_accepted" : 1, "anim_sprite": "Pat02/Pat02Anim01.png", "pattern" :
[ # difficulty 1.5 TORN TRASH BAG
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 2.0, 	"anim_sprite":"Pat02/Pat02Anim02.png", "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, 	"anim_sprite":"Pat02/Pat02Anim03.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, 	"anim_sprite":"Pat02/Pat02Anim04.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 2.0, 	"position": Vector2(1600.0, 500.0), "timer": 3.0, 	"anim_sprite":"Pat02/Pat02Anim05.png", "draw_line" : false},
	{"input": "input_left"	, "delay": 1.0, 	"position": Vector2(1600.0, 920.0), "timer": 2.0, 	"anim_sprite":"Pat02/Pat02Anim06.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 920.0), "timer": 2.0, 	"anim_sprite":"Pat02/Pat02Anim07.png", "draw_line" : true}
]}
	
const pattern3 = { "nb_fail_accepted" : 2, "anim_sprite": "Pat03/Pat03Anim01.png", "pattern" :
[ # difficulty 1.5 SIMPLE CONTAINER
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, 	"anim_sprite":"Pat03/Pat03Anim02.png", "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, 	"anim_sprite":"Pat03/Pat03Anim03.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, 	"anim_sprite":"Pat03/Pat03Anim04.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(400.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat03/Pat03Anim05.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(1000.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat03/Pat03Anim06.png", "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, 	"anim_sprite":"Pat03/Pat03Anim07.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(1000.0, 880.0), "timer": 3.0, 	"anim_sprite":"Pat03/Pat03Anim08.png", "draw_line" : true},	
]}


const pattern4 = { "nb_fail_accepted" : 2, "anim_sprite": "Pat04/Pat04Anim01.png", "pattern" :
[ # difficulty 2 OLD CONTAINER
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, 	"anim_sprite":"Pat04/Pat04Anim02.png", "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, 	 "anim_sprite":"Pat04/Pat04Anim03.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim04.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(400.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim05.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(600.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim06.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(600.0, 450.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim07.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(800.0, 450.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim08.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 1.0, 	"position": Vector2(800.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim09.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 1.0, 	"position": Vector2(1000.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat04/Pat04Anim10.png", "draw_line" : true},
	{"input": "input_action", "delay": 1.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, 	 "anim_sprite":"Pat04/Pat04Anim11.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(1000.0, 880.0), "timer": 3.0,  	 "anim_sprite":"Pat04/Pat04Anim12.png","draw_line" : true},
]}

const pattern5 = { "nb_fail_accepted" : 3, "anim_sprite": "Pat05/Pat05Anim01.png", "pattern" :
[ # difficulty 2.5 PLASTIC CONTAINER
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 2.0, 	"anim_sprite":"Pat05/Pat05Anim02.png", "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, 	"anim_sprite":"Pat05/Pat05Anim03.png", "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, 	"anim_sprite":"Pat05/Pat05Anim04.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(400.0, 250.0), "timer": 3.0, 	"anim_sprite":"Pat05/Pat05Anim05.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(600.0, 250.0), "timer": 1.5, 	"anim_sprite":"Pat05/Pat05Anim06.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(600.0, 450.0), "timer": 1.5, 	"anim_sprite":"Pat05/Pat05Anim07.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(800.0, 450.0), "timer": 1.5, 	"anim_sprite":"Pat05/Pat05Anim08.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(800.0, 650.0), "timer": 1.5, 	"anim_sprite":"Pat05/Pat05Anim09.png", "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(1000.0, 650.0), "timer": 1.5, 	"anim_sprite":"Pat05/Pat05Anim10.png", "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(1000.0, 880.0), "timer": 1.5, 	"anim_sprite":"Pat05/Pat05Anim11.png", "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, 	"anim_sprite":"Pat05/Pat05Anim12.png", "draw_line" : true},
]}

const pattern6 = { "nb_fail_accepted" : 3, "pattern" :
[ # difficulty 3 DOUBLE CONTAINER
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1200.0, 880.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_up"	, "delay": 1.0, 	"position": Vector2(400.0, 880.0), "timer": 2.0, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_right"	, "delay": 1.66, 	"position": Vector2(400.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(600.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 0.66, 	"position": Vector2(600.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(800.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_action", "delay": 2.0, 	"position": Vector2(1200.0,  650.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_left"	, "delay": 2.0, 	"position": Vector2(1000.0, 250.0), "timer": 3.0, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(800.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_left"	, "delay": 0.66, 	"position": Vector2(800.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_up"	, "delay": 0.66, 	"position": Vector2(600.0, 450.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_left"	, "delay": 0.66, 	"position": Vector2(600.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_down"	, "delay": 0.66, 	"position": Vector2(400.0, 250.0), "timer": 1.5, "draw_line" : true},
	{"input": "input_right"	, "delay": 2.0, 	"position": Vector2(400.0, 880.0), "timer": 3.0, "draw_line" : true},
]}
