extends Node
var fcolor:= Color(0.76, 0.0, 0.0, 1.0)
var vcolor:= Color(0.76, 0.532, 0.0, 1.0)
var ncolor:= Color(0.0, 0.78, 0.234, 1.0)
var jcolor:= Color(0.114, 0.0, 0.76, 1.0)
var fcolo:= Color(0.592, 0.0, 0.0, 1.0)
var vcolo:= Color(0.39, 0.274, 0.0, 1.0)
var ncolo:= Color(0.0, 0.354, 0.259, 1.0)
var jcolo:= Color(0.124, 0.0, 0.873, 1.0)
var score = 0.0
var max_score = 0.0
var selected = -1
var vol:=6
var hvol:=6
var rady = 0
var pop = 0.0
var ms = ""
var bpm := 132
var move = false
var ke := 0
var hardness:= 0
var level_list = [
["Prophecy","Creo",load("res://levels/Prophecy/Prophecy.jpg"),"Prophecy",0,1,2,3,4,5,6,7], #aaaaaaaaaaaaaaaaaaaa \
["Headspace","Ash Astral",load("res://levels/Headspace/Headspace.jpg"),"Headspace",0,1,2,3,4,5,6,7],\
["drnfctn","Frums",load("res://levels/drnfctn/drnfctn.jpg"),"drnfctn",0,1,2,3,4,5,6,7],\
["?","Artifyber",load("res://levels/ques/ques.jpg"),"ques",0,1,2,3,4,5,6,7],
["ε","Artifyber",load("res://levels/eps/eps.jpg"),"eps",0,1,2,3,4,5,6,7],
["FRACTURED//ANOMALY","FIREENTITY",load("res://levels/frac/frac.jpg"),"frac",0,1,2,3,4,5,6,7
]]
#name,artist,img,file,speed,rhythm,stamina,length
var level_notes:= []
var song = ""
var video = ""
var offset = 50
var dis := true
var paused = false
var sat:=1.0
var len:= 0.0
var speed := 1.0
var of := Vector2(0,0)
var glitch:= 0.0
var negate:= 0.0
var po:= Vector2.ZERO
var pos:= Vector2.ZERO
var zo:= Vector2.ONE * 4
var sc:= Vector2.ONE
var ro:= 0.0
var rs:= 0.0
var plays = 0.0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
