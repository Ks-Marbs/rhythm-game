extends Node
var score = 0
var rady = 0
var bpm = 0
var move = false
var level_notes:= []
var a = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	a = Array(str_to_var(FileAccess.open("res://levels/drnfctn - Frums.txt",FileAccess.READ).get_as_text(true).replace("\n", "")))
	bpm = a.pop_front()[0]
	level_notes = a
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
