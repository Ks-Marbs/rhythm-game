extends Sprite2D
var a:= 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	a = (Global.ke[4] - 33)*100
	if Input.is_action_pressed("p"):
		region_rect = Rect2(a,100,100,100)
	else:
		region_rect = Rect2(a,0,100,100)
	pass
