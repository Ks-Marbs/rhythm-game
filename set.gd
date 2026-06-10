extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HSlider.value = Global.vol
	$HSlider2.value = Global.hvol
	$HSlider3.value = Global.speed
	$CheckBox.button_pressed = Global.dis
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
