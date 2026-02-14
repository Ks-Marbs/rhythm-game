extends ColorRect
var caught:= false
var hold_time:= 0
var sco := 0
var held:= false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalTimer.connect("timeout",Callable(self,"on_timeout"))
	for m in range(hold_time):
		var i = ColorRect.new()
		i.set_script(load("res://held.gd"))
		i.size = size+Vector2(2,0)
		i.self_modulate = Color(1,1,1,0.35)
		i.position = Vector2(-m-1,-m-1)
		i.z_index = -4
		add_child(i)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if int(position[0]) in range(-14,0) and not caught:
		if Input.is_action_just_pressed(str(self.get_parent().name)[0]):
			held = true
			if int(position[0]) in range(-10,-4):
				sco = 2
			else:
				sco = 1
			Global.score += sco
			caught = true
	if not Input.is_action_pressed(str(self.get_parent().name)[0]) and held:
		held = false
	if int(position[0]) > 0 and not caught:
		self.modulate = Color(0,0,0,0)
	if int(position[0]) > (-6):
		self.self_modulate = Color(0,0,0,0)
	else:
		size = Vector2(1,position[0]*(-2)+13)+Vector2.ONE
		position = Vector2(position[0],-size[1]/2)
	pass


func on_timeout() -> void:
	position=position+Vector2.RIGHT
	if int(position[0]) > (-6):
		position=position+Vector2.DOWN
	pass # Replace with function body.
