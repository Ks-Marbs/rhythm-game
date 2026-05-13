extends Sprite2D
var b:=0
var a:=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match str(self.name)[0]:
		"f":
			b=0
			a=0 
		"v":
			b=100
			a=0 
		"n":
			b=0
			a=100 
		"j":
			b=100
			a=100 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed(str(self.name)[0]):
		region_rect = Rect2(a,b+200,100,100)
	else:
		region_rect = Rect2(a,b,100,100)
	pass


func _on_node_2d_bap(L: Variant, P: Variant) -> void:
	if P == str(self.name)[0]:
		var b = load("res://bap.tscn")
		var i = b.instantiate()
		i.position = Vector2(-55,55)
		match L:
			0:
				i.modulate = Color.from_hsv(0.0, Global.sat, 1.0, 1.0)
				i.text = "MISS!"
			1:
				i.modulate = Color.from_hsv(0.153, Global.sat, 1.0, 1.0)
				i.text = "EARLY!"
			2:
				i.modulate = Color.from_hsv(0.264, Global.sat, 1.0, 1.0)
				i.text = "PERFECT!"
			3:
				i.modulate = Color.from_hsv(0.153, Global.sat, 1.0, 1.0)
				i.text = "LATE!"
		add_child(i)
	pass # Replace with function body.
