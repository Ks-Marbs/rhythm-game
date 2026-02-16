extends Node2D

func start():
		Global.load_level("res://levels/drnfctn - Frums.txt")
		get_tree().change_scene_to_file("res://lvl.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.pressed.connect(start)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
