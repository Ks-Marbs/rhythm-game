extends Node2D
var busy:=false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i = -1
	for lvl in Global.level_list:
		i+=1
		var a = load("res://leveltap.tscn")
		var b = a.instantiate()
		b.bub = i
		b.bap = "[b]"+lvl[0]+"[/b]\n"+lvl[1]
		add_child(b)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$set.visible = Global.paused
	if Global.selected == -1:
		$RichTextLabel.text = "Up[b]\n\n[/b]Down[b]\n\n[/b]Select[b]\n\n[/b]Settings"
	else:
		$RichTextLabel.text = " [b]\n\n[/b] [b]\n\n[/b]Play[b]\n\n[/b]Back"
	if Input.is_action_just_pressed("f") and !busy and (Global.pop > 0.0) and Global.selected == -1:
		busy = true
		var k = int(Global.pop)-1.0
		while Global.pop > k:
			Global.pop += (k-0.1-Global.pop)/9
			await get_tree().create_timer(delta).timeout
		Global.pop = k
		Global.pop = float(int(Global.pop))
		busy = false
	if Input.is_action_just_pressed("v") and !busy and Global.selected == -1:
		busy = true
		var k = int(Global.pop)+1.0
		while Global.pop < k:
			Global.pop += (k+0.1-Global.pop)/9
			await get_tree().create_timer(delta).timeout
		Global.pop = k
		Global.pop = float(int(Global.pop))
		busy = false
	if Input.is_action_just_pressed("j") and !busy:
		busy = true
		if Global.selected != -1:
			Global.selected = -1
			var k = int(Global.pop)-10.0
			while Global.pop > k:
				Global.pop += (k-0.5-Global.pop)/9
				await get_tree().create_timer(delta).timeout
			Global.pop = k
			Global.pop = float(int(Global.pop))
		else:
			Global.paused = !Global.paused
		busy = false
	pass
