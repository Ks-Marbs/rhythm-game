extends Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_wait_time((2.4/Global.bpm))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
