extends Node2D

func end():
	var s = (("%07d") % int(Global.ms))
	FileAccess.open("res://levels/"+Global.level_list[Global.selected][0]+"/score.txt",FileAccess.WRITE).store_string(s)
	Global.selected = -1
	Global.pop = 0
	Global.plays = 0
	Global.po = Vector2(0,0)
	Global.pos = Vector2(0,0)
	Global.zo = Vector2(4,4)
	Global.ro = 0
	Global.rs = 0
	Global.score = 0
	Global.max_score = 0
	get_tree().change_scene_to_file("res://menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible and (Input.is_action_just_pressed("n") or Input.is_action_just_pressed("f") or Input.is_action_just_pressed("v") or Input.is_action_just_pressed("j")):
		end()
	pass


func _on_c_end() -> void:
		if int(Global.score*1000000/Global.max_score) == 0:
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]OOF![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(700,0,100,100)
		if int(Global.score*1000000/Global.max_score) in range(1,299999):
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]You tried![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(600,0,100,100)
		if int(Global.score*1000000/Global.max_score) in range(300000,399999):
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]Don't give up![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(500,0,100,100)
		if int(Global.score*1000000/Global.max_score) in range(400000,499999):
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]Good job![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(400,0,100,100)
		if int(Global.score*1000000/Global.max_score) in range(500000,599999):
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]Keep going![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(300,0,100,100)
		if int(Global.score*1000000/Global.max_score) in range(600000,799999):
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]You can do it![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(200,0,100,100)
		if int(Global.score*1000000/Global.max_score) in range(800000,999999):
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]Well done![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(100,0,100,100)
		if int(Global.score*1000000/Global.max_score) >= 1000000:
			$Sprite2D/RichTextLabel.text = ("Score: %07d \n[b]PERFECT!! LETS GO![/b]") % int(Global.score*1000000/Global.max_score)
			$Sprite2D/Sprite2D.region_rect = Rect2(0,0,100,100)
		if int(Global.score*1000000/Global.max_score) > int(Global.ms):
			if Global.ms != "0000000":
				$Sprite2D/RichTextLabel.text = ("Score: "+Global.ms+"\n[b]New best![/b]")
			Global.ms = ("%07d") % int(Global.score*1000000/Global.max_score)
		visible = true
