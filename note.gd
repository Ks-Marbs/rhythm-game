extends ColorRect
var caught:= false
var hold_time:= 0
var beat:= 5.0
var sco := 0
var held:= false
var blo:=0.0
var cot := 0
var speed := 1.0
var a:=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.max_score += 5
	blo = (beat+(Global.offset/get_parent().bar_size))*speed
	for m in range(hold_time*speed):
		var i = ColorRect.new()
		i.set_script(load("res://held.gd"))
		i.size = size+Vector2(2,0)
		i.self_modulate = Color(1.0, 1.0, 1.0, 0.7)
		i.position = Vector2(-m-1,-m-1)
		i.z_index = -4
		i.b = m
		if m != 0 and m % 12 == 0: Global.max_score += 4
		add_child(i)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = Vector2(-size[0]/2,-((blo-Global.plays*(Global.bpm/60.0))*get_parent().bar_size))
	size = Vector2(  lerpf(get_parent().start_size,get_parent().end_size,   ((blo-Global.plays*(Global.bpm/60.0))*get_parent().bar_size/get_parent().length) )   ,3)
	if position[1] > 2*int(Global.speed*4)+hold_time*get_parent().bar_size+5:
		queue_free()
	if int(position[1]) in range(-2*int(Global.speed*4),2*int(Global.speed*4)) and not caught and not Global.paused:
		if Input.is_action_just_pressed(str(self.get_parent().name)[0]):
			held = true
			caught = true
			if int(position[1]) in range(-int(Global.speed*4),int(Global.speed*4)):
				sco = 5
				self.get_parent().get_parent().get_parent().emit_signal("bap",2,self.get_parent().name)
				a=2
				self_modulate += Color(0.47, 0.47, 0.47, 1.0)
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.47, 0.47, 0.47, 1.0)
			else:
				sco = 4
				self_modulate += Color(0.23, 0.23, 0.23, 1.0)
				if int(position[1]) < 0:
					self.get_parent().get_parent().get_parent().emit_signal("bap",1,self.get_parent().name)
					a=1
				else:
					self.get_parent().get_parent().get_parent().emit_signal("bap",3,self.get_parent().name)
					a=3
				self.get_parent().get_parent().get_child(0).play()
				self_modulate -= Color(0.23, 0.23, 0.23, 1.0)
			Global.score += sco
	if position[1] > 2*int(Global.speed*4):
		modulate = Color(0,0,0,0.2)
		self.get_parent().get_parent().get_parent().emit_signal("bap",0,self.get_parent().name)
	if not Input.is_action_pressed(str(self.get_parent().name)[0]) and held:
		held = false
	pass
