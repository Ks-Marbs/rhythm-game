extends Node2D
var t:= 0.0
signal lod
signal bap(L,P)
# Called when the node enters the scene tree for the first time.
func beep(v,a,b,c):
	v.scale = Vector2.ONE/$Camera2D.zoom*c
	v.position = Vector2((-360.0+4.0*a)/$Camera2D.zoom[0],(-360.0+4.0*b)/$Camera2D.zoom[1])

func w():
	Global.paused = not Global.paused
	if Global.paused:
		$Camera2D/VideoStreamPlayer.set_paused(true)
	else:
		$Camera2D/VideoStreamPlayer.set_stream_position(Global.plays)
		$Camera2D/VideoStreamPlayer.set_paused(false)
func _ready():
	load_()

func load_():
	$Camera2D/VideoStreamPlayer.speed_scale = Global.speed
	$Camera2D/VideoStreamPlayer.stream = load(Global.video)
	for k in Global.level_notes:
		match k.pop_front():
			"s":
				$Sprite2D/s.notes.append(k)
			"d":
				$Sprite2D/d.notes.append(k)
			"f":
				$Sprite2D/f.notes.append(k)
			"v":
				$Sprite2D/v.notes.append(k)
			"n":
				$Sprite2D/n.notes.append(k)
			"j":
				$Sprite2D/j.notes.append(k)
			"k":
				$Sprite2D/k.notes.append(k)
			"l":
				$Sprite2D/l.notes.append(k)
			"w":
				$Sprite2D/w.notes.append(k)
			"c":
				$Sprite2D/c.notes.append(k)
	emit_signal("lod")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D/VideoStreamPlayer.modulate.a = Global.op
	$Sprite2D.modulate.a = Global.bop
	var effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("Master"), 0)
	effect.set_pitch_scale(1/Global.speed)
	get_window().size = Global.ws * 480
	get_window().position=Global.wp+Vector2(DisplayServer.screen_get_size()/2 - get_window().size/2)
	Global.plays = $Camera2D/VideoStreamPlayer.get_stream_position()
	$Camera2D/set.visible = Global.paused
	beep($Camera2D/score,20,15,1)
	beep($Camera2D/Glitch,0,0,1)
	beep($Camera2D/Negate,0,0,1)
	beep($Camera2D/Graey,0,0,1)
	beep($Camera2D/Node2D,85.7,85.75,1)
	beep($Camera2D/Pause,150,20,0.75)
	beep($Camera2D/sb,21,160,0.75)
	beep($Camera2D/db,40,160,0.75)
	beep($Camera2D/fb,59,160,0.75)
	beep($Camera2D/vb,78,160,0.75)
	beep($Camera2D/nb,97,160,0.75)
	beep($Camera2D/jb,116,160,0.75)
	beep($Camera2D/kb,135,160,0.75)
	beep($Camera2D/lb,154,160,0.75)
	beep($Camera2D/set,86,86,1)
	Global.plays = $Camera2D/VideoStreamPlayer.get_stream_position()
	$Camera2D/VideoStreamPlayer.scale = Vector2.ONE / $Camera2D.zoom
	$Camera2D/VideoStreamPlayer.position = (Vector2.ONE*-360.0) / $Camera2D.zoom
	$Camera2D/VideoStreamPlayer.volume = Global.vol/8.0
	$Sprite2D/hit.volume_linear = Global.hvol/15.0
	if Global.rady == 9:
		$Camera2D/VideoStreamPlayer.play()
		Global.rady = 0
	$Camera2D/score.text = ("Score: %07d") % int(Global.score*1000000/Global.max_score)
	$Sprite2D/s.modulate = Global.sc8
	$Sprite2D/d.modulate = Global.dc8
	$Sprite2D/f.modulate = Global.fc8
	$Sprite2D/v.modulate = Global.vc8
	$Sprite2D/n.modulate = Global.nc8
	$Sprite2D/j.modulate = Global.jc8
	$Sprite2D/k.modulate = Global.kc8
	$Sprite2D/l.modulate = Global.lc8
	$Camera2D/Glitch.modulate.a = Global.glitch
	$Camera2D/Negate.modulate.a = Global.negate
	$Camera2D/Graey.color.a = Global.graey 
	$Camera2D/sb.self_modulate = Global.sc8
	$Camera2D/db.self_modulate = Global.dc8
	$Camera2D/fb.self_modulate = Global.fc8
	$Camera2D/vb.self_modulate = Global.vc8
	$Camera2D/nb.self_modulate = Global.nc8
	$Camera2D/jb.self_modulate = Global.jc8
	$Camera2D/kb.self_modulate = Global.kc8
	$Camera2D/lb.self_modulate = Global.lc8

	if Input.is_action_pressed("s8"):
		Global.sco8  = Color.from_hsv(0.0,Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/s.self_modulate = Global.sco8 
	else:
		Global.sco8  = Color.from_hsv(0.0, Global.sat, 0.488, 1.0)
		$Sprite2D/s.self_modulate = Global.sco8 
	if Input.is_action_pressed("d8"):
		Global.dco8  = Color.from_hsv(0.083,Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/d.self_modulate = Global.dco8 
	else:
		Global.dco8  = Color.from_hsv(0.083, Global.sat, 0.488, 1.0)
		$Sprite2D/d.self_modulate = Global.dco8 
	if Input.is_action_pressed("f8"):
		Global.fco8  = Color.from_hsv(0.117,Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/f.self_modulate = Global.fco8 
	else:
		Global.fco8  = Color.from_hsv(0.117, Global.sat, 0.488, 1.0)
		$Sprite2D/f.self_modulate = Global.fco8 
	if Input.is_action_pressed("v8"):
		Global.vco8  = Color.from_hsv(0.455, Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/v.self_modulate = Global.vco8 
	else:
		Global.vco8  = Color.from_hsv(0.455, Global.sat, 0.54, 1.0)
		$Sprite2D/v.self_modulate = Global.vco8 
	if Input.is_action_pressed("n8"):
		Global.nco8  = Color.from_hsv(0.5, Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/n.self_modulate = Global.nco8 
	else:
		Global.nco8  = Color.from_hsv(0.5, Global.sat, 0.354, 1.0)
		$Sprite2D/n.self_modulate = Global.nco8 
	if Input.is_action_pressed("j8"):
		Global.jco8  = Color.from_hsv(0.575, Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/j.self_modulate = Global.jco8 
	else:
		Global.jco8  = Color.from_hsv(0.575, Global.sat, 0.49, 1.0)
		$Sprite2D/j.self_modulate = Global.jco8 
	if Input.is_action_pressed("k8"):
		Global.kco8  = Color.from_hsv(0.792,Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/k.self_modulate = Global.kco8 
	else:
		Global.kco8  = Color.from_hsv(0.792, Global.sat, 0.488, 1.0)
		$Sprite2D/k.self_modulate = Global.kco8 
	if Input.is_action_pressed("l8"):
		Global.lco8  = Color.from_hsv(0.833,Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/l.self_modulate = Global.lco8 
	else:
		Global.lco8  = Color.from_hsv(0.833, Global.sat, 0.488, 1.0)
		$Sprite2D/l.self_modulate = Global.lco8 


	if Input.is_action_just_pressed("p"):
		w()
	Global.plays = $Camera2D/VideoStreamPlayer.get_stream_position()
	$Sprite2D.position = Global.pos 
	$Sprite2D.rotation = Global.rs
	$Sprite2D.scale = Global.sc
	$Camera2D.rotation = Global.ro
	$Camera2D.zoom = Global.zo
	$Camera2D.position= Global.po + Global.of
	pass
