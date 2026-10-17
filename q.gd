extends Sprite2D
var a:=0
var num:=0
var x:=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func b():
	match str(self.name):
		"f":
			a = (Global.ke[0] - 65)*100
		"v":
			a = (Global.ke[1] - 65)*100
			num = 1
		"n":
			a = (Global.ke[2] - 65)*100
			num = 2
		"j":
			a = (Global.ke[3] - 65)*100
			num = 3
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if get_parent().m == 0:
		b()
	if Input.is_action_pressed(str(self.name)):
		region_rect = Rect2(a,100,100,100)
		if get_parent().m == 2:
			a = 4000
			x = true
			Global.ke[num] = 0
	else:
		region_rect = Rect2(a,0,100,100)
	pass # Replace with function body.
	
