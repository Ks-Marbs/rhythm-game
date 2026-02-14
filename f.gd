extends Sprite2D
var notes:= []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_node_2d_ready() -> void:
	for note in notes:
		match note[1]:
			0:
				var b = load("res://fnote.tscn")
				var i = b.instantiate()
				i.position = Vector2((-7-75)-(25)*note[0],-0.142)
				i.z_index = -4
				add_child(i)
			1:
				var b = load("res://hold.tscn")
				var i = b.instantiate()
				i.position = Vector2((-7-75)-(25)*note[0],-0.142)
				i.z_index = -4
				i.hold_time = note[2]*25
				add_child(i)
	Global.rady += 1

	pass # Replace with function body.
