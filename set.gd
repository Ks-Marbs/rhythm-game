extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Global.vol
	$HSlider2.value = Global.hvol
	$HSlider3.value = Global.speed
	$CheckBox.button_pressed = Global.dis
	Global.ke = int(FileAccess.open("res://keys.txt",FileAccess.READ).get_as_text())

	InputMap.action_erase_events("f")
	InputMap.action_erase_events("v")
	InputMap.action_erase_events("n")
	InputMap.action_erase_events("j")
	match Global.ke:
		0:
			var f = InputEventKey.new()
			f.keycode = KEY_F
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_V
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_N
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_J
			InputMap.action_add_event("j", j)
		1:
			var f = InputEventKey.new()
			f.keycode = KEY_D
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_F
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_J
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_K
			InputMap.action_add_event("j", j)
		2:
			var f = InputEventKey.new()
			f.keycode = KEY_F
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_G
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_H
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_J
			InputMap.action_add_event("j", j)
		3:
			var f = InputEventKey.new()
			f.keycode = KEY_A
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_S
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_D
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_W
			InputMap.action_add_event("j", j)
		6:
			var f = InputEventKey.new()
			f.keycode = KEY_K
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_K
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_K
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_K
			InputMap.action_add_event("j", j)
		4:
			var f = InputEventKey.new()
			f.keycode = KEY_LEFT
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_DOWN
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_RIGHT
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_UP
			InputMap.action_add_event("j", j)
		5:
			var f = InputEventKey.new()
			f.keycode = KEY_KP_4
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_KP_2
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_KP_6
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_KP_8
			InputMap.action_add_event("j", j)
	FileAccess.open("res://levels/keys.txt",FileAccess.WRITE).store_string(str(Global.ke))

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.vol=$HSlider.value
	Global.hvol = $HSlider2.value 
	Global.speed = $HSlider3.value
	$RichTextLabel5.text = "Speed: x"+str(Global.speed)
	pass


func _on_check_box_toggled(toggled_on: bool) -> void:
	Global.dis = toggled_on
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	InputMap.action_erase_events("f")
	InputMap.action_erase_events("v")
	InputMap.action_erase_events("n")
	InputMap.action_erase_events("j")
	match index:
		0:
			var f = InputEventKey.new()
			f.keycode = KEY_F
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_V
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_N
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_J
			InputMap.action_add_event("j", j)
		1:
			var f = InputEventKey.new()
			f.keycode = KEY_D
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_F
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_J
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_K
			InputMap.action_add_event("j", j)
		2:
			var f = InputEventKey.new()
			f.keycode = KEY_F
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_G
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_H
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_J
			InputMap.action_add_event("j", j)
		3:
			var f = InputEventKey.new()
			f.keycode = KEY_A
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_S
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_D
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_W
			InputMap.action_add_event("j", j)
		6:
			var f = InputEventKey.new()
			f.keycode = KEY_K
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_K
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_K
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_K
			InputMap.action_add_event("j", j)
		4:
			var f = InputEventKey.new()
			f.keycode = KEY_LEFT
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_DOWN
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_RIGHT
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_UP
			InputMap.action_add_event("j", j)
		5:
			var f = InputEventKey.new()
			f.keycode = KEY_KP_4
			InputMap.action_add_event("f", f)
			var v = InputEventKey.new()
			v.keycode = KEY_KP_2
			InputMap.action_add_event("v", v)
			var n = InputEventKey.new()
			n.keycode = KEY_KP_6
			InputMap.action_add_event("n", n)
			var j = InputEventKey.new()
			j.keycode = KEY_KP_8
			InputMap.action_add_event("j", j)
	Global.ke = index
	FileAccess.open("res://keys.txt",FileAccess.WRITE).store_string(str(index))
	pass # Replace with function body.
