extends Node2D
var fcolor:= Color(0.592, 0.0, 0.0, 1.0)
var vcolor:= Color(0.39, 0.274, 0.0, 1.0)
var ncolor:= Color(0.0, 0.354, 0.259, 1.0)
var jcolor:= Color(0.124, 0.0, 0.873, 1.0)
var fcolo:= Color(0.592, 0.0, 0.0, 1.0)
var vcolo:= Color(0.39, 0.274, 0.0, 1.0)
var ncolo:= Color(0.0, 0.354, 0.259, 1.0)
var jcolo:= Color(0.124, 0.0, 0.873, 1.0)
var beat := -75
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.rady == 4:
		$Song.play(0.5)
		Global.rady = 0
	$Sprite2D/Camera2D/score.scale = Vector2.ONE/$Sprite2D/Camera2D.zoom
	$Sprite2D/Camera2D/score.position = Vector2(-343/$Sprite2D/Camera2D.zoom[0]+20,-343/$Sprite2D/Camera2D.zoom[1]+20)
	$Sprite2D/Camera2D/score.text = "Score:"+str(Global.score)
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
	pass


func _on_timer_timeout() -> void:
	beat += 1
	pass # Replace with function body.
