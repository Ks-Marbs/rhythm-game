extends Node2D
var busy:=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().set_embedding_subwindows(false)
	var j = FileAccess.open("res://levels/bap.txt",FileAccess.READ).get_as_text().replace("0,note_on,", "").strip_edges().split("\n")
	var o = []
	for d in j:
		var p = d.split(",")
		match p[1]:
			"E0":
				o.append(["w", float(int(float(p[4])*48.0)/48.0)+1.0, 0])
			"F0":
				o.append(["f", float(int(float(p[4])*48.0)/48.0)+1.0, 0])
			"G0":
				o.append(["v", float(int(float(p[4])*48.0)/48.0)+1.0, 0])
			"A0":
				o.append(["n", float(int(float(p[4])*48.0)/48.0)+1.0, 0])
			"B0":
				o.append(["j", float(int(float(p[4])*48.0)/48.0)+1.0, 0])
			"F1":
				o.append(["f",float(int(float(p[4])*48.0)/48.0)+1.0, 1,float(int(float(p[3])*48.0)/48.0)])
			"G1":
				o.append(["v", float(int(float(p[4])*48.0)/48.0)+1.0, 1,float(int(float(p[3])*48.0)/48.0)])
			"A1":
				o.append(["n", float(int(float(p[4])*48.0)/48.0)+1.0, 1,float(int(float(p[3])*48.0)/48.0)])
			"B1":
				o.append(["j", float(int(float(p[4])*48.0)/48.0)+1.0, 1,float(int(float(p[3])*48.0)/48.0)])
	FileAccess.open("res://levels/bop.txt",FileAccess.WRITE).store_string(str(o))
	var i = -1
	for lvl in Global.level_list:
		i+=1
		var a = load("res://leveltap.tscn")
		var b = a.instantiate()
		b.bub = i
		b.bap = "[b]"+lvl[0]+"[/b]\n"+lvl[1]
		b.qa = float(lvl[4])
		b.ra = float(lvl[5])
		b.sa = float(lvl[6])
		b.ta = float(lvl[7])
		add_child(b)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var effect = AudioServer.get_bus_effect(AudioServer.get_bus_index("Pitch"), 0)
	effect.set_pitch_scale(1/Global.speed)
	$VideoStreamPlayer.speed_scale = Global.speed
	$f.self_modulate = Global.fcolor
	$v.self_modulate = Global.vcolor
	$n.self_modulate = Global.ncolor
	$j.self_modulate = Global.jcolor
	get_window().size = Global.ws * 480
	get_window().position=Global.wp+Vector2(DisplayServer.screen_get_size()/2 - get_window().size/2)
	match Global.hardness:
		0:
			$h.text = "[wave amp=6.0 freq=0.9 connected=0]  Easy>[/wave]"
		1: 
			$h.text = "[wave amp=6.0 freq=0.9 connected=0]<Hard  [/wave]"
	$VideoStreamPlayer.volume = Global.vol/7.0
	$hit.volume_linear = Global.hvol/15.0
	$set.visible = Global.paused
	if Global.selected == -1:
		$RichTextLabel.text = "Up[b]\n\n[/b]Down[b]\n\n[/b]Select[b]\n\n[/b]Settings"
	else:
		$RichTextLabel.text = "Left[b]\n\n[/b]Right[b]\n\n[/b]Play[b]\n\n[/b]Back"
	if Input.is_action_just_pressed("f") and !busy and (Global.pop > 0.0) and Global.selected == -1 and !Global.paused:
		busy = true
		$hit.play()
		var k = int(Global.pop)-1.0
		while Global.pop > k:
			Global.pop += (k-0.1-Global.pop)/9
			await get_tree().create_timer(delta).timeout
		Global.pop = k
		Global.pop = float(int(Global.pop))
		busy = false
	if Input.is_action_just_pressed("v") and !busy and Global.selected == -1 and (Global.pop <Global.level_list.size()-1) and !Global.paused:
		busy = true
		$hit.play()
		var k = int(Global.pop)+1.0
		while Global.pop < k:
			Global.pop += (k+0.1-Global.pop)/9
			await get_tree().create_timer(delta).timeout
		Global.pop = k
		Global.pop = float(int(Global.pop))
		busy = false
	if Input.is_action_just_pressed("n") and !busy:
		busy=true
		await get_tree().create_timer(210*delta).timeout
		busy=false
	if Input.is_action_just_pressed("j") and !busy:
		busy = true
		$hit.play()
		if Global.selected != -1:
			Global.video = "res://levels/Bap.ogv"
			$VideoStreamPlayer.stream = load(Global.video)
			$VideoStreamPlayer.play()
			Global.selected = -1
			var k = int(Global.pop)-10.0
			while Global.pop > k:
				Global.pop += (k-0.5-Global.pop)/9
				await get_tree().create_timer(delta).timeout
			Global.pop = k
			Global.pop = float(int(Global.pop))
		else:
			Global.paused = !Global.paused
		await get_tree().create_timer(10*delta).timeout
		busy = false
	pass
