extends Node2D
var start_size := 23.0
var end_size := 329.0
var length := 150.0
var bar_size := 25.0
var notes:= []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$start.size = Vector2(start_size,3)
	$start.position = Vector2(-start_size/2.0,0)
	$end.size = Vector2(end_size,3)
	$end.position = Vector2(-end_size/2.0,-length)
	pass


func _on_node_2d_lod() -> void:
	for note in notes:
		match int(note[1]):
			0:
				var b = load("res://note.tscn")
				var i = b.instantiate()
				i.position = Vector2(0,length*2)
				i.z_index = -4
				i.beat = note[0]
				i.use_parent_material = true
				if note.size()> 2 and Global.dis: i.speed = note[2]
				add_child(i)
			1:
				var b = load("res://note.tscn")
				var i = b.instantiate()
				i.position = Vector2(0,length*2)
				i.z_index = -4
				i.beat = note[0]
				i.use_parent_material = true
				i.hold_time = note[2]*bar_size
				if note.size()> 3 and Global.dis: i.speed = note[3]
				add_child(i)
	Global.rady += 1
	pass # Replace with function body.
