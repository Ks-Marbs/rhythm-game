extends ColorRect
var caught:= false
var hold_time:= 0
var beat:= 0.0
var sco := 0
var held:= false
var blo:=0.0
var cot := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.max_score += 3
	blo = (-7-Global.offset+11)-(25.0)*beat
	for m in range(hold_time):
		var i = ColorRect.new()
		i.set_script(load("res://held.gd"))
		i.size = size+Vector2(2,0)
		i.self_modulate = Color(1,1,1,0.35)
		i.position = Vector2(-m-1,-m-1)
		i.z_index = -4
		i.b = m
		if m != 0 and m % 10 == 0: Global.max_score += 5
		add_child(i)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (blo+Global.plays*5.0*Global.bpm/12.0) > -230:
		position = Vector2(blo+(Global.plays*5.0*Global.bpm/12.0), 0)
	if position[0] > 500:
		queue_free()
	if int(position[0]) in range(-24,10) and not caught and not Global.paused:
		if Input.is_action_just_pressed(str(self.get_parent().name)[0]):
			held = true
			if int(position[0]) in range(-15,1):
				sco = 5
				self_modulate += Color(0.47, 0.47, 0.47, 1.0)
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.47, 0.47, 0.47, 1.0)
			else:
				sco = 4
				self_modulate += Color(0.23, 0.23, 0.23, 1.0)
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.23, 0.23, 0.23, 1.0)

			Global.score += sco
			caught = true
	if not Input.is_action_pressed(str(self.get_parent().name)[0]) and held:
		held = false
	if int(position[0]) > 0 and not caught:
		self.modulate = Color(0,0,0,0)
	if int(position[0]) > (0):
		self.self_modulate = Color(0,0,0,0)
		size = Vector2(1,position[0]*(2)-13)-Vector2.ONE
		position = Vector2(position[0],size[1]/2)
	else:
		size = Vector2(1,position[0]*(-2)+13)+Vector2.ONE
		position = Vector2(position[0],-size[1]/2)
	pass
