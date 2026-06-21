extends ReferenceRect
var caught:= false
var hold_time:= 0
var beat:= 0.0
var sco := 0
var held:= false
var blo:=0.0
var cot := 0
var a:=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.max_score += 5
	blo = (-7-Global.offset+11)-(25.0)*beat
	for m in range(hold_time):
		var i = ColorRect.new()
		i.set_script(load("res://held.gd"))
		i.self_modulate = Color(1.0, 1.0, 1.0, 0.7)
		i.size = Vector2(m+2,m+2)
		i.z_index = -4
		i.b = m
		if m != 0 and m % 12 == 0: Global.max_score += 4
		add_child(i)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (blo+Global.plays*5.0*Global.bpm/12.0) > -230:
		size = Vector2(blo+(Global.plays*5.0*Global.bpm/12.0),blo+(Global.plays*5.0*Global.bpm/12.0))
	if size[0] < 15+hold_time*25:
		queue_free()
	if int(size[0]) in range(-16,2) and not caught and not Global.paused:
		if Input.is_action_just_pressed(str(self.get_parent().name)[0]):
			held = true
			caught = true
			if int(size[0]) in range(-12,-2):
				sco = 5
				self.get_parent().get_parent().get_parent().emit_signal("bap",2,self.get_parent().name)
				a=2
				self_modulate += Color(0.47, 0.47, 0.47, 1.0)
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.47, 0.47, 0.47, 1.0)
			else:
				sco = 4
				self_modulate += Color(0.23, 0.23, 0.23, 1.0)
				if int(size[0]) < -7:
					self.get_parent().get_parent().get_parent().emit_signal("bap",1,self.get_parent().name)
					a=1
				else:
					self.get_parent().get_parent().get_parent().emit_signal("bap",3,self.get_parent().name)
					a=3
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.23, 0.23, 0.23, 1.0)
			Global.score += sco
	if not Input.is_action_pressed(str(self.get_parent().name)[0]) and held:
		held = false
	if int(size[0]) > (6) and not caught:
		self.get_parent().get_parent().get_parent().emit_signal("bap",0,self.get_parent().name)
		caught = true
	if int(size[0]) > (6):
		self.self_modulate = Color(0,0,0,0)
	pass
