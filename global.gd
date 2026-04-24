extends Node
var score = 0.0
var max_score = 0.0
var selected = -1
var vol:=6
var hvol:=6
var rady = 0
var pop = 0.0
var bpm := 132
var move = false
var level_list = [["Prophecy","Creo",load("res://images/prophecy.jpg"),"Prophecy"],["drnfctn","Frums",load("res://images/drnfctn.jpg"),"drnfctn - Frums"]]
var level_notes:= []
var song = ""
var video = ""
var offset = 50
var paused = false
var len:= 0.0
var po:= Vector2.ZERO
var zo:= Vector2.ONE * 4
var ro:= 0.0
var plays = 0.0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
