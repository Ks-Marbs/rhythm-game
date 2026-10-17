extends Node2D

var m := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Global.vol
	$HSlider2.value = Global.hvol
	$HSlider3.value = Global.speed
	$HSlider4.value = Global.graey
	$CheckBox.button_pressed = Global.dis
	Global.ke = Array(str_to_var(FileAccess.open("res://keys.txt",FileAccess.READ).get_as_text()))

	InputMap.action_erase_events("f")
	InputMap.action_erase_events("v")
	InputMap.action_erase_events("n")
	InputMap.action_erase_events("j")
	var f = InputEventKey.new()
	f.keycode = Global.ke[0]
	InputMap.action_add_event("f", f)
	var v = InputEventKey.new()
	v.keycode = Global.ke[1]
	InputMap.action_add_event("v", v)
	var n = InputEventKey.new()
	n.keycode = Global.ke[2]
	InputMap.action_add_event("n", n)
	var j = InputEventKey.new()
	j.keycode = Global.ke[3]
	InputMap.action_add_event("j", j)
	FileAccess.open("res://levels/keys.txt",FileAccess.WRITE).store_string(str(Global.ke))

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.vol=$HSlider.value
	Global.hvol = $HSlider2.value 
	Global.speed = $HSlider3.value
	Global.graey = $HSlider4.value
	$RichTextLabel5.text = "Speed: x"+str(Global.speed)
	if m == 1:
		if position.x > -1000:
			position.x += (-1100-position.x)/8
		else:
			m = 2
	pass


func _on_check_box_toggled(toggled_on: bool) -> void:
	Global.dis = toggled_on
	pass # Replace with function body.



func _on_button_pressed() -> void:
	m=1
	pass # Replace with function body.
