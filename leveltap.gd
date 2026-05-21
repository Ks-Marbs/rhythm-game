extends ColorRect
var bub:=0
var bap:=""
var busy := false
# Called when the node enters the scene tree for the first time.
var midi := false

func load_level(boop:String):
	Global.level_notes = Array(str_to_var(FileAccess.open(boop,FileAccess.READ).get_as_text(true).replace("\n", "")))
	Global.bpm = Global.level_notes[0][0]
	Global.song = Global.level_notes[0][1]
	Global.offset = Global.level_notes[0][2]
	Global.video = Global.level_notes[0][3]
	Global.ro = Global.level_notes[0][4]
	Global.rs = Global.level_notes[0][5]
	Global.po[0] = Global.level_notes[0][6]
	Global.po[1] = Global.level_notes[0][7]
	Global.pos[0] = Global.level_notes[0][8]
	Global.pos[1] = Global.level_notes[0][9]
	Global.zo[0] = Global.level_notes[0][10]
	Global.zo[1] = Global.level_notes[0][11]
	Global.plays = 0
	Global.ms = FileAccess.open("res://levels/"+Global.level_list[bub][0]+"/score.txt",FileAccess.READ).get_as_text(true)



func _ready() -> void:
	$RichTextLabel.text = bap
	var s = FileAccess.open("res://levels/"+Global.level_list[bub][0]+"/score.txt",FileAccess.READ).get_as_text(true)
	$ColorRect/RichTextLabel.text = s
	if int(s) == 0:
		$ColorRect/Sprite2D.region_rect = Rect2(700,0,100,100)
	if int(s) in range(1,299999):
		$ColorRect/Sprite2D.region_rect = Rect2(600,0,100,100)
	if int(s) in range(300000,399999):
		$ColorRect/Sprite2D.region_rect = Rect2(500,0,100,100)
	if int(s) in range(400000,499999):
		$ColorRect/Sprite2D.region_rect = Rect2(400,0,100,100)
	if int(s) in range(500000,599999):
		$ColorRect/Sprite2D.region_rect = Rect2(300,0,100,100)
	if int(s) in range(600000,799999):
		$ColorRect/Sprite2D.region_rect = Rect2(200,0,100,100)
	if int(s) in range(800000,999999):
		$ColorRect/Sprite2D.region_rect = Rect2(100,0,100,100)
	if int(s) == 1000000:
		$ColorRect/Sprite2D.region_rect = Rect2(0,0,100,100)
	$TextureRect.texture = Global.level_list[bub][2]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.selected == -1:
		while $ColorRect.scale[1] > -0.1:
			$ColorRect.scale += Vector2(0,-abs(cos($ColorRect.scale[1]/2)/5))
			await get_tree().create_timer(delta).timeout
		if Global.pop - bub > 0.1 or Global.pop - bub < -0.2:
			position = Vector2((90)-((bub-Global.pop)*60.0),(-30)+(90.0*(bub-Global.pop)))
		else:
			position = Vector2(-150-((bub-Global.pop)*60.0),(-30)+(90.0*(bub-Global.pop)))
			if Input.is_action_just_pressed("n") and !Global.paused:
				Global.selected = bub
		busy = false
	elif Global.selected == bub:
		position = Vector2(-140,(-30))
		if !busy:
			busy = true
			var k = int(Global.pop)+10
			while Global.pop < k:
				Global.pop += (k+0.5-Global.pop)/9
				await get_tree().create_timer(delta).timeout
			Global.pop = k
			Global.pop = float(int(Global.pop))
			position = Vector2(-140,(-30))
			while $ColorRect.scale[1] < 3:
				$ColorRect.scale += Vector2(0,cos($ColorRect.scale[1]/2)/5)
				await get_tree().create_timer(delta).timeout
		if Input.is_action_just_pressed("n") and !Global.paused:
			load_level("res://levels/"+Global.level_list[bub][0]+"/"+Global.level_list[bub][0]+".txt")
			get_tree().change_scene_to_file("res://lvl.tscn")
	else:
		position = Vector2(150-((bub-Global.pop)*60.0),position[1])
	pass
