extends Sprite2D
var b:=0
var a:=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match Global.ke:
		0:
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
		1:
			match str(self.name)[0]:
				"f":
					b=100
					a=300 
				"v":
					b=0
					a=0 
				"n":
					b=100
					a=100 
				"j":
					b=100
					a=400 
		2:
			match str(self.name)[0]:
				"f":
					b=0
					a=0 
				"v":
					b=0
					a=400 
				"n":
					b=0
					a=500 
				"j":
					b=100
					a=100 
		3:
			match str(self.name)[0]:
				"v":
					b=100
					a=200 
				"f":
					b=0
					a=300
				"n":
					b=100
					a=300 
				"j":
					b=0
					a=200

		4:
			match str(self.name)[0]:
				"v":
					b=0
					a=900 
				"f":
					b=100
					a=800
				"n":
					b=100
					a=900 
				"j":
					b=0
					a=800 

		5:
			match str(self.name)[0]:
				"v":
					b=0
					a=700 
				"f":
					b=100
					a=600
				"n":
					b=100
					a=700 
				"j":
					b=0
					a=600 
		6:
			match str(self.name)[0]:
				"f":
					b=100
					a=400 
				"v":
					b=100
					a=400 
				"n":
					b=100
					a=400 
				"j":
					b=100
					a=400 

	if Input.is_action_pressed(str(self.name)[0]):
		region_rect = Rect2(a,b+200,100,100)
	else:
		region_rect = Rect2(a,b,100,100)
	pass


func _on_node_2d_bap(L: Variant, P: Variant) -> void:
	if P == str(self.name)[0] or P=="w":
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
