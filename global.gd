extends Node
var fcolor:= Color(0.76, 0.0, 0.0, 1.0)
var vcolor:= Color(0.76, 0.532, 0.0, 1.0)
var ncolor:= Color(0.0, 0.78, 0.234, 1.0)
var jcolor:= Color(0.05, 0.352, 0.72, 1.0)
var fcolo:= Color(0.592, 0.0, 0.0, 1.0)
var vcolo:= Color(0.39, 0.274, 0.0, 1.0)
var ncolo:= Color(0.0, 0.354, 0.259, 1.0)
var jcolo:= Color(0.0, 0.27, 0.49, 1.0)
var sc8:= Color(0.76, 0.0, 0.0, 1.0)
var dc8:= Color(0.76, 0.38, 0.0, 1.0)
var fc8:= Color(0.76, 0.532, 0.0, 1.0)
var vc8:= Color(0.0, 0.78, 0.234, 1.0)
var nc8:= Color(0.0, 0.78, 0.78, 1.0)
var jc8:= Color(0.05, 0.352, 0.72, 1.0)
var kc8:= Color(0.553, 0.05, 0.72, 1.0)
var lc8:= Color(0.72, 0.05, 0.72, 1.0)
var sco8:= Color(0.592, 0.0, 0.0, 1.0)
var dco8:= Color(0.59, 0.295, 0.0, 1.0)
var fco8:= Color(0.39, 0.274, 0.0, 1.0)
var vco8:= Color(0.0, 0.354, 0.259, 1.0)
var nco8:= Color(0.0, 0.35, 0.35, 1.0)
var jco8:= Color(0.0, 0.27, 0.49, 1.0)
var kco8:= Color(0.368, 0.0, 0.49, 1.0)
var lco8:= Color(0.49, 0.0, 0.49, 1.0)
var score = 0.0
var max_score = 0.0
var selected = -1
var vol:=6
var hvol:=6
var rady = 0
var bop = 0.8
var op = 1.0
var pop = 0.0
var ms = ""
var bpm := 132
var move = false
var ke := [70,86,78,74,80,83,68,70,86,78,74,75,76]
var hardness:= 0
var graey := 0.0
var level_list = [["TERA-I/O","Cametek",load("res://levels/frac/frac.jpg"),"Tera",0,1,2,3,4,5,6,7,1],
["Welcome","Ks",load("res://levels/Welcome/Welcome.jpg"),"Welcome",0,1,2,3,4,5,6,7,0],
["Prophecy","Creo",load("res://levels/Prophecy/Prophecy.jpg"),"Prophecy",0,1,2,3,4,5,6,7,0], #aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa \
["Headspace","Ash Astral",load("res://levels/Headspace/Headspace.jpg"),"Headspace",0,1,2,3,4,5,6,7,0],\
["drnfctn","Frums",load("res://levels/drnfctn/drnfctn.jpg"),"drnfctn",0,1,2,3,4,5,6,7,0],\
["?","Artifyber",load("res://levels/ques/ques.jpg"),"ques",0,1,2,3,4,5,6,7,0],
["ε","Artifyber",load("res://levels/eps/eps.jpg"),"eps",0,1,2,3,4,5,6,7,0],
["FRACTURED//ANOMALY","FIREENTITY",load("res://levels/frac/frac.jpg"),"frac",0,1,2,3,4,5,6,7,0]
]
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
var wp:= Vector2.ZERO
var ws:= Vector2.ONE
var plays = 0.0

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass
