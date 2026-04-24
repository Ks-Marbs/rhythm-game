extends Sprite2D
var notes:= []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
 
func end():
	var s = ""
	for i in range(Global.level_list.size()*7):
		s += "0"
	for i in range(7):
		s[Global.selected*7+i] = (("%07d") % int(Global.score*1000000/Global.max_score))[i]
	FileAccess.open("res://images/score.txt",FileAccess.WRITE).store_string(s)
	Global.selected = -1
	Global.pop = 0
	Global.plays = 0
	Global.po = Vector2(0,0)
	Global.zo = Vector2(4,4)
	Global.ro = 0
	Global.score = 0
	Global.max_score = 0
	get_tree().change_scene_to_file("res://menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for note in notes:
		match note[0]:
			"r":
				if Global.plays*5.0*Global.bpm/12.0 > note[3]*25+(Global.offset) and\
				 Global.plays*5.0*Global.bpm/12.0 < (note[3]+note[4])*25+(Global.offset) :
					rotate_camera(note[1],note[2],note[3],note[4],note[5])
			"p":
				if Global.plays*5.0*Global.bpm/12.0 > note[5]*25+(Global.offset) and\
				 Global.plays*5.0*Global.bpm/12.0 < (note[5]+note[6])*25+(Global.offset) :
					position_camera(note[1],note[2],note[3],note[4],note[5],note[6],note[7])
			"z":
				if Global.plays*5.0*Global.bpm/12.0 > note[5]*25+(Global.offset) and\
				 Global.plays*5.0*Global.bpm/12.0 < (note[5]+note[6])*25+(Global.offset) :
					zoom_camera(note[1],note[2],note[3],note[4],note[5],note[6],note[7])
			"e":
				if Global.plays*5.0*Global.bpm/12.0 > note[1]*25+(Global.offset):
					end()
	pass

func _on_node_2d_lod() -> void:
	Global.rady += 1
	pass

func rotate_camera(start,end:float,ts:float,t:float,ease):
	var blue = Global.plays*5.0*Global.bpm/12.0
	ts = ts*25.0+(Global.offset-4)
	t = t*25
	if (blue > ts-5) and (blue < ts+t):
		var k = ((blue-ts)/t)
		match ease:
			"line":
				Global.ro = lerp(start,end,k)
			"sin":
				Global.ro = lerp(start,end,-(cos(PI * k) - 1) / 2)
			"in-sin":
				Global.ro = lerp(start,end,1-(cos(PI * k) / 2))
			"out-sin":
				Global.ro = lerp(start,end,sin(PI * k / 2))


func position_camera(s1,s2,e1,e2,ts:float,t:float,ease):
	var blue = Global.plays*5.0*Global.bpm/12.0
	ts = ts*25.0+(Global.offset-4)
	t = t*25
	if (blue > ts-5) and (blue < ts+t):
		var k = ((blue-ts)/t)
		match ease:
			"line":
				Global.po = Vector2(s1,s2).lerp(Vector2(e1,e2),k)
			"sin":
				Global.po  = Vector2(s1,s2).lerp(Vector2(e1,e2),-(cos(PI * k) - 1) / 2)
			"in-sin":
				Global.po  =Vector2(s1,s2).lerp(Vector2(e1,e2),1-(cos(PI * k) / 2))
			"out-sin":
				Global.po  = Vector2(s1,s2).lerp(Vector2(e1,e2),sin(PI * k / 2))

func zoom_camera(s1,s2,e1,e2,ts:float,t:float,ease):
	var blue = Global.plays*5.0*Global.bpm/12.0
	ts = ts*25.0+(Global.offset-4)
	t = t*25
	if (blue > ts-5) and (blue < ts+t):
		var k = ((blue-ts)/t)
		match ease:
			"line":
				Global.zo = Vector2(s1,s2).lerp(Vector2(e1,e2),k)
			"sin":
				Global.zo  = Vector2(s1,s2).lerp(Vector2(e1,e2),-(cos(PI * k) - 1) / 2)
			"in-sin":
				Global.zo  = Vector2(s1,s2).lerp(Vector2(e1,e2),1-(cos(PI * k) / 2))
			"out-sin":
				Global.zo  = Vector2(s1,s2).lerp(Vector2(e1,e2),sin(PI * k / 2))
