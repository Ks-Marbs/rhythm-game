extends NinePatchRect
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
	blo = (-Global.offset)-(25.0)*beat
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = size / (-2.0)
	size = Vector2(blo+(Global.plays*5.0*Global.bpm/12.0),blo+(Global.plays*5.0*Global.bpm/12.0))*(-2)
	if size[0] < 7:
		self_modulate = Color(0,0,0,0)
	if size[0] < -20:
		queue_free() 
	if int(size[0]) in range(9,49) and not caught and not Global.paused:
		if Input.is_action_just_pressed("f") or Input.is_action_just_pressed("v") or Input.is_action_just_pressed("n") or Input.is_action_just_pressed("j"):
			caught = true
			if int(size[0]) in range(-39,39):
				sco = 5
				self.get_parent().get_parent().get_parent().emit_signal("bap",2,"w")
				a=2
				self_modulate += Color(0.47, 0.47, 0.47, 1.0)
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.47, 0.47, 0.47, 1.0)
			else:
				sco = 4
				self_modulate += Color(0.23, 0.23, 0.23, 1.0)
				if int(size[0]) < 29:
					self.get_parent().get_parent().get_parent().emit_signal("bap",1,"w")
					a=1
				else:
					self.get_parent().get_parent().get_parent().emit_signal("bap",3,"w")
					a=3
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.23, 0.23, 0.23, 1.0)
			Global.score += sco
	pass
