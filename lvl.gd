extends Node2D
var fcolor:= Color(0.592, 0.0, 0.0, 1.0)
var vcolor:= Color(0.39, 0.274, 0.0, 1.0)
var ncolor:= Color(0.0, 0.354, 0.259, 1.0)
var jcolor:= Color(0.124, 0.0, 0.873, 1.0)
var fcolo:= Color(0.592, 0.0, 0.0, 1.0)
var vcolo:= Color(0.39, 0.274, 0.0, 1.0)
var ncolo:= Color(0.0, 0.354, 0.259, 1.0)
var jcolo:= Color(0.124, 0.0, 0.873, 1.0)
var t:= 0.0
signal lod
# Called when the node enters the scene tree for the first time.
func beep(v,a,b,c):
	v.scale = Vector2.ONE/$Sprite2D/Camera2D.zoom*c
	v.position = Vector2((-343.0+4.0*a)/$Sprite2D/Camera2D.zoom[0],(-343.0+4.0*b)/$Sprite2D/Camera2D.zoom[1])

func w():
	Global.paused = not Global.paused
	if Global.paused:
		$Sprite2D/Camera2D/VideoStreamPlayer.set_paused(true)
	else:
		$Sprite2D/Camera2D/VideoStreamPlayer.set_paused(false)
func _ready():
	load_()

func load_() -> void:
	$Sprite2D/Camera2D/VideoStreamPlayer.stream = load(Global.video)
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
	$Sprite2D/Camera2D/set.visible = Global.paused
	beep($Sprite2D/Camera2D/score,20,20,1)
	beep($Sprite2D/Camera2D/Pause,150,20,0.75)
	beep($Sprite2D/Camera2D/fb,35,150,1)
	beep($Sprite2D/Camera2D/vb,70,150,1)
	beep($Sprite2D/Camera2D/nb,105,150,1)
	beep($Sprite2D/Camera2D/set,86,86,1)
	beep($Sprite2D/Camera2D/jb,140,150,1)
	Global.plays = $Sprite2D/Camera2D/VideoStreamPlayer.get_stream_position()
	$Sprite2D/Camera2D/VideoStreamPlayer.scale = Vector2.ONE / $Sprite2D/Camera2D.zoom
	$Sprite2D/Camera2D/VideoStreamPlayer.position = (Vector2.ONE*-344.0) / $Sprite2D/Camera2D.zoom
	$Sprite2D/Camera2D/VideoStreamPlayer.volume = Global.vol/3.0
	$Sprite2D/hit.volume_linear = Global.hvol*2.0
	if Global.rady == 5:
		$Sprite2D/Camera2D/VideoStreamPlayer.play()
		Global.rady = 0
	$Sprite2D/Camera2D/score.text = ("Score: %07d") % int(Global.score*1000000/Global.max_score)
	$Sprite2D/f.modulate = fcolor
	$Sprite2D/v.modulate = vcolor
	$Sprite2D/n.modulate = ncolor
	$Sprite2D/j.modulate = jcolor
	$Sprite2D/f.self_modulate = fcolo
	$Sprite2D/v.self_modulate = vcolo
	$Sprite2D/n.self_modulate = ncolo
	$Sprite2D/j.self_modulate = jcolo
	if Input.is_action_pressed("f"):
		fcolo = Color(0.993, 0.732, 0.7, 1.0)
	else:
		fcolo = Color(0.488, 0.0, 0.0, 1.0)
	if Input.is_action_pressed("v"):
		vcolo = Color(0.981, 0.867, 0.637, 1.0)
	else:
		vcolo = Color(0.54, 0.378, 0.0, 1.0)
	if Input.is_action_pressed("n"):
		ncolo = Color(0.264, 0.923, 0.746, 1.0)
	else:
		ncolo = Color(0.0, 0.354, 0.259, 1.0)
	if Input.is_action_pressed("j"):
		jcolo = Color(0.4, 0.527, 0.999, 1.0)
	else:
		jcolo = Color(0.074, 0.0, 0.49, 1.0)
	if Input.is_action_just_pressed("p"):
		w()
	pass

func _physics_process(delta: float) -> void:
	$Sprite2D/Camera2D.rotation = Global.ro
	$Sprite2D/Camera2D.zoom = Global.zo
	$Sprite2D/Camera2D.position= Global.po
