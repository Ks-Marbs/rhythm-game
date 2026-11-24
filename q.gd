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
			a = (Global.ke[0] - 33)*100
			num = 0
		"v":
			a = (Global.ke[1] - 33)*100
			num = 1
		"n":
			a = (Global.ke[2] - 33)*100
			num = 2
		"j":
			a = (Global.ke[3] - 33)*100
			num = 3
		"p":
			a = (Global.ke[4] - 33)*100
			num = 4
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if get_parent().m == 0:
		b()
	if Input.is_action_just_released(str(self.name)) and not x:
		if get_parent().m == 2:
			var e = true
			for k in Global.ke:
				if k == 105: e = false
			if e:
				InputMap.action_erase_events(str(self.name))
				x = true
				Global.ke[num] = 105
				a = (Global.ke[num] - 33)*100
				region_rect = Rect2(a,100,100,100)
	else:
		region_rect = Rect2(a,0,100,100)
	pass # Replace with function body.
	
func _unhandled_key_input(event: InputEvent) -> void:
	if x and event is InputEventKey:
		Global.ke[num] = event.keycode
		var f = InputEventKey.new()
		f.keycode = Global.ke[num]
		InputMap.action_add_event(str(self.name), event)
		a = (Global.ke[num] - 33)*100
		region_rect = Rect2(a,100,100,100)
		x = false
		b()
