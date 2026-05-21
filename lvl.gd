extends Node2D
var t:= 0.0
signal lod
signal bap(L,P)
# Called when the node enters the scene tree for the first time.
func beep(v,a,b,c):
	v.scale = Vector2.ONE/$Camera2D.zoom*c
	v.position = Vector2((-343.0+4.0*a)/$Camera2D.zoom[0],(-343.0+4.0*b)/$Camera2D.zoom[1])

func w():
	Global.paused = not Global.paused
	if Global.paused:
		$Camera2D/VideoStreamPlayer.set_paused(true)
	else:
		$Camera2D/VideoStreamPlayer.set_stream_position(Global.plays)
		$Camera2D/VideoStreamPlayer.set_paused(false)
func _ready():
	load_()

func load_() -> void:
	$Camera2D/VideoStreamPlayer.stream = load(Global.video)
	for k in Global.level_notes:
		match k.pop_front():
			"f":
				$Sprite2D/f.notes.append(k)
			"v":
				$Sprite2D/v.notes.append(k)
			"n":
				$Sprite2D/n.notes.append(k)
			"j":
				$Sprite2D/j.notes.append(k)
			"c":
				$Sprite2D/c.notes.append(k)
	emit_signal("lod")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera2D/set.visible = Global.paused
	beep($Camera2D/score,20,15,1)
	beep($Camera2D/Glitch,0,0,1)
	beep($Camera2D/Negate,0,0,1)
	beep($Camera2D/Node2D,85.7,85.75,1)
	beep($Camera2D/Pause,150,20,0.75)
	beep($Camera2D/fb,35,150,1)
	beep($Camera2D/vb,70,150,1)
	beep($Camera2D/nb,105,150,1)
	beep($Camera2D/set,86,86,1)
	beep($Camera2D/jb,140,150,1)
	Global.plays = $Camera2D/VideoStreamPlayer.get_stream_position()
	$Camera2D/VideoStreamPlayer.scale = Vector2.ONE / $Camera2D.zoom
	$Camera2D/VideoStreamPlayer.position = (Vector2.ONE*-344.0) / $Camera2D.zoom
	$Camera2D/VideoStreamPlayer.volume = Global.vol/7.0
	$Sprite2D/hit.volume_linear = Global.hvol/15.0
	if Global.rady == 5:
		$Camera2D/VideoStreamPlayer.play()
		Global.rady = 0
	$Camera2D/score.text = ("Score: %07d") % int(Global.score*1000000/Global.max_score)
	$Sprite2D/f.modulate = Global.fcolor
	$Sprite2D/v.modulate = Global.vcolor
	$Sprite2D/n.modulate = Global.ncolor
	$Sprite2D/j.modulate = Global.jcolor
	$Camera2D/Glitch.modulate.a = Global.glitch
	$Camera2D/Negate.modulate.a = Global.negate

	$Camera2D/fb.self_modulate = Global.fcolor
	$Camera2D/vb.self_modulate = Global.vcolor
	$Camera2D/nb.self_modulate = Global.ncolor
	$Camera2D/jb.self_modulate = Global.jcolor
	if Input.is_action_pressed("f"):
		Global.fcolo = Color.from_hsv(0.0,Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/f.self_modulate = Global.fcolo
	else:
		Global.fcolo = Color.from_hsv(0.0, Global.sat, 0.488, 1.0)
		$Sprite2D/f.self_modulate = Global.fcolo
	if Input.is_action_pressed("v"):
		Global.vcolo = Color.from_hsv(0.117, Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/v.self_modulate = Global.vcolo
	else:
		Global.vcolo = Color.from_hsv(0.117, Global.sat, 0.54, 1.0)
		$Sprite2D/v.self_modulate = Global.vcolo
	if Input.is_action_pressed("n"):
		Global.ncolo = Color.from_hsv(0.455, Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/n.self_modulate = Global.ncolo
	else:
		Global.ncolo = Color.from_hsv(0.455, Global.sat, 0.354, 1.0)
		$Sprite2D/n.self_modulate = Global.ncolo
	if Input.is_action_pressed("j"):
		Global.jcolo = Color.from_hsv(0.631, Global.sat*0.3, 0.993, 1.0)
		$Sprite2D/j.self_modulate = Global.jcolo
	else:
		Global.jcolo = Color.from_hsv(0.631, Global.sat, 0.49, 1.0)
		$Sprite2D/j.self_modulate = Global.jcolo
	if Input.is_action_just_pressed("p"):
		w()
	if abs(Global.plays - $Camera2D/VideoStreamPlayer.get_stream_position()) > 0.4:
		$Camera2D/VideoStreamPlayer.set_paused(true)
		$Camera2D/VideoStreamPlayer.set_stream_position(Global.plays)
		$Camera2D/VideoStreamPlayer.set_paused(false)
	pass

func _physics_process(delta: float) -> void:
	$Sprite2D.position = Global.pos
	$Sprite2D.rotation = Global.rs
	$Camera2D.rotation = Global.ro
	$Camera2D.zoom = Global.zo
	$Camera2D.position= Global.po
