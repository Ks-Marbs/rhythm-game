extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Global.vol
	$HSlider2.value = Global.hvol
	$HSlider3.value = Global.sat
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $HSlider3.value_changed:
		Global.sat = $HSlider3.value
		Global.fcolor.s = Global.sat
		Global.vcolor.s = Global.sat
		Global.ncolor.s = Global.sat
		Global.jcolor.s = Global.sat
		Global.fcolo.s = Global.sat
		Global.vcolo.s = Global.sat
		Global.ncolo.s = Global.sat
		Global.jcolo.s = Global.sat
	Global.vol=$HSlider.value
	Global.hvol = $HSlider2.value 
	if visible and Input.is_action_just_pressed("f"):
		Global.plays = 0
		Global.paused = false
		Global.level_notes = Array(str_to_var(FileAccess.open("res://levels/"+Global.level_list[Global.selected][0]+"/"+Global.level_list[Global.selected][0]+".txt",FileAccess.READ).get_as_text(true).replace("\n", "")))
		Global.bpm = Global.level_notes[0][0]
		Global.song = Global.level_notes[0][1]
		Global.offset = Global.level_notes[0][2]
		Global.video = Global.level_notes[0][3]
		Global.score = 0
		Global.pos = Vector2.ZERO
		Global.po = Vector2.ZERO
		Global.zo = Vector2.ONE*4
		Global.ro = 0.0
		Global.rs = 0.0
		Global.ms = FileAccess.open("res://levels/"+Global.level_list[Global.selected][0]+"/score.txt",FileAccess.READ).get_as_text(true)
		get_tree().change_scene_to_file("res://lvl.tscn")
	if visible and Input.is_action_just_pressed("j"):
		Global.paused = false
		Global.pop = 0
		Global.selected = -1
		Global.score = 0
		Global.pos = Vector2.ZERO
		Global.po = Vector2.ZERO
		Global.zo = Vector2.ZERO
		Global.ro = 0.0
		Global.rs = 0.0
		Global.ms = FileAccess.open("res://levels/"+Global.level_list[Global.selected][0]+"/score.txt",FileAccess.READ).get_as_text(true)
		get_tree().change_scene_to_file("res://menu.tscn")
	pass
