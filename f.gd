extends Sprite2D
var notes:= []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_node_2d_lod() -> void:
	for note in notes:
		match int(note[1]):
			0:
				var b = load("res://fnote.tscn")
				var i = b.instantiate()
				i.position = Vector2((-7-Global.offset)-(25)*note[0],-0.142)
				i.z_index = -4
				i.beat = note[0]
				i.use_parent_material = true
				if note.size()> 2 and Global.dis: i.speed = note[2]
				add_child(i)
			1:
				var b = load("res://hold.tscn")
				var i = b.instantiate()
				i.position = Vector2((-7-Global.offset)-(25)*note[0],-0.142)
				i.z_index = -4
				i.beat = note[0]
				i.use_parent_material = true
				i.hold_time = note[2]*25
				if note.size()> 3 and Global.dis: i.speed = note[3]
				add_child(i)
	Global.rady += 1
	pass # Replace with function body.
