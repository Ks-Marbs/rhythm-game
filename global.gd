extends Node
var score = 0
var rady = 0
var bpm := 132
var move = false
var level_notes:= []
var song = ""

func load_level(boop):
	level_notes = Array(str_to_var(FileAccess.open(boop,FileAccess.READ).get_as_text(true).replace("\n", "")))
	Global.bpm = level_notes[0][0]
	song = level_notes.pop_front()[1]

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
