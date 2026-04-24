extends ColorRect
var active = false
var dif = Vector2(0, 0)
var pos = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var b = Button.new()
	b.scale = Vector2(0.5,0.5)
	b.size = Vector2(8,8)
	b.self_modulate = Color(0,0,0,0)
	b.connect("button_down",Callable(self,"on_bd"))
	b.connect("button_up",Callable(self,"on_bp"))
	add_child(b)
	pos = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = Vector2((floori(pos[0])/4)*4,pos[1])
	var mouse_position = get_parent().get_local_mouse_position()
	if active:
		pos = Vector2(clamp((mouse_position + dif)[0],0,16),(mouse_position + dif)[1])
	match int(position[0]):
		0:
			modulate = Color(0.592, 0.0, 0.0, 1.0)
		4:
			modulate = Color(0.39, 0.274, 0.0, 1.0)
		8:
			modulate = Color(0.0, 0.354, 0.259, 1.0)
		12:
			modulate = Color(0.124, 0.0, 0.873, 1.0)
		16:
			modulate = Color(0.27, 0.27, 0.27, 1.0)

func on_bd():
	dif = pos - get_parent().get_local_mouse_position()
	active = true

func on_bp():
	active = false
	pass
