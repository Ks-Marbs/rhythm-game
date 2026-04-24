extends Node2D
var bpm := 0
var level_notes:=[]
var audio:=""
var beat = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$play.pressed.connect($preview.w)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



#open old file
func _on_file_dialog_file_selected(boop) -> void:
	Global.load_level(boop)
	for k in Global.level_notes:
		match k.pop_front():
			"f":
				var b = ColorRect.new()
				b.modulate =Color(0.592, 0.0, 0.0, 1.0)
				b.set_script(load("res://editnote.gd"))
				b.size = Vector2(4,4)
				b.position = Vector2(0,k[0]*32)
				if k[1] != 0:
					b.size = Vector2(4,4*k[2])
				$NinePatchRect.add_child(b)
			"v":
				var b = ColorRect.new()
				b.modulate =Color(0.39, 0.274, 0.0, 1.0)
				b.set_script(load("res://editnote.gd"))
				b.size = Vector2(4,4)
				b.position = Vector2(4,k[0]*32)
				if k[1] != 0:
					b.size = Vector2(4,4*k[2])
				$NinePatchRect.add_child(b)
			"n":
				var b = ColorRect.new()
				b.modulate =Color(0.0, 0.354, 0.259, 1.0)
				b.set_script(load("res://editnote.gd"))
				b.size = Vector2(4,4)
				b.position = Vector2(8,k[0]*32)
				if k[1] != 0:
					b.size = Vector2(4,4*k[2])
				$NinePatchRect.add_child(b)
			"j":
				var b = ColorRect.new()
				b.modulate =Color(0.124, 0.0, 0.873, 1.0)
				b.set_script(load("res://editnote.gd"))
				b.size = Vector2(4,4)
				b.position = Vector2(12,k[0]*32)
				if k[1] != 0:
					b.size = Vector2(4,4*k[2])
				$NinePatchRect.add_child(b)
	$preview.load_()
	pass # Replace with function body.
