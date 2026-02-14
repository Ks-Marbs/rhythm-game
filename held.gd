extends ColorRect
var place := 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalTimer.connect("timeout",Callable(self,"on_timeout"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size = Vector2(1,(position[0]+self.get_parent().position[0])*-2+13)
	if self.get_parent().held and place == 1:
		place = position[0]
	if place == 0 and self.get_parent().held:
		place = 2
		Global.score += self.get_parent().sco
	if not self.get_parent().held and place < 0:
		self_modulate=Color(0,0,0,0)
	pass

func on_timeout() -> void:
	if place < 0:
		place += 1
	pass
