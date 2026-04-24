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
