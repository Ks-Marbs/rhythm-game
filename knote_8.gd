extends ColorRect
var caught:= false
var hold_time:= 0
var beat:= 0.0
var sco := 0
var held:= false
var blo:=0.0
var cot := 0
var speed := 1.0
var a:=0
var d := blo
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.max_score += 5
	blo = (4-Global.offset*speed)-(25.0)*beat*speed
	for m in range(hold_time*speed):
		var i = ColorRect.new()
		i.set_script(load("res://held8.gd"))
		i.size = size+Vector2(1,0)
		i.self_modulate = Color(1.0, 1.0, 1.0, 0.7)
		i.position = Vector2(-m-1,-m-1)
		i.z_index = -4
		i.b = m
		if m != 0 and m % 12 == 0: Global.max_score += 4
		add_child(i)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = PI/4
	d = (blo+Global.plays*5.0*Global.bpm*speed/12.0)
	if  d > -230:
		position = -Vector2.from_angle(PI/4).normalized()*d
	if d > 15+hold_time*25:
		queue_free()
	if -7-2*int(Global.speed*4)< d and d < -7+2*int(Global.speed*4) and not caught and not Global.paused:
		if Input.is_action_just_pressed(str(self.get_parent().name)[0]+"8"):
			held = true
			caught = true
			if -7-1*int(Global.speed*4)< d and d < -7+1*int(Global.speed*4):
				sco = 5
				self.get_parent().get_parent().get_parent().emit_signal("bap",2,self.get_parent().name)
				a=2
				self_modulate += Color(0.47, 0.47, 0.47, 1.0)
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.47, 0.47, 0.47, 1.0)
			else:
				sco = 4
				self_modulate += Color(0.23, 0.23, 0.23, 1.0)
				if d < -7:
					self.get_parent().get_parent().get_parent().emit_signal("bap",1,self.get_parent().name)
					a=1
				else:
					self.get_parent().get_parent().get_parent().emit_signal("bap",3,self.get_parent().name)
					a=3
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.23, 0.23, 0.23, 1.0)
			Global.score += sco
	if not Input.is_action_pressed(str(self.get_parent().name)[0]+"8") and held:
		held = false
	if d > 6 and not caught:
		self.get_parent().get_parent().get_parent().emit_signal("bap",0,self.get_parent().name)
		caught = true
	if d > 1:
		position = Vector2.from_angle(PI/4).normalized()*d + Vector2(1,-1).normalized() * (size[1]/2)
	else:
		size = Vector2(3,d/(-1.23)+3)
		position = Vector2.from_angle(PI/4).normalized()*d + Vector2(1,-1).normalized() * (size[1]/2)
	pass
