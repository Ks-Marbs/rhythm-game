extends NinePatchRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$VScrollBar.max_value = Global.len*Global.bpm/15.0 - 16
	size = Vector2(20,Global.len*Global.bpm*8/15.0)
	if not Global.paused:
		$VScrollBar.value = Global.plays*Global.bpm/30
		position = Vector2(-343.386,($VScrollBar.value)*(-64)-343.509)
		$VScrollBar.position = Vector2(19.898,$VScrollBar.value*8-0.082)
	else:
		position = Vector2(-343.386,($VScrollBar.value)*(-64)-343.509)
		$VScrollBar.position = Vector2(19.898,$VScrollBar.value*8-0.082)
	pass
