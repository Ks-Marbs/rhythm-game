extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func w():
	if position.y > 40:
		modulate.a -= 0.05
		position.y -= 1
		await get_tree().create_timer(0.04).timeout
		w()
	else:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	w()
	pass
