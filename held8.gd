extends ColorRect
var place := 1
var on = false
var b := 0
var n := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function bod.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size = Vector2(2,(get_parent().position + position).length()/(1.23)+5)
	position = Vector2(-b,-b/2.0)
	if b % 12 == 0 and self.get_parent().cot != 100 and self.get_parent().held and\
	position[0]+self.get_parent().position[0] > self.get_parent().cot and !on:
		on = true
		Global.score += self.get_parent().sco
		if b % 24==0:
			self.get_parent().get_parent().get_parent().get_parent().emit_signal("bap",self.get_parent().a,self.get_parent().get_parent().name)
	if !self.get_parent().held and self.get_parent().caught and !n:
		self_modulate=Color(0.0, 0.0, 0.0, 0.4)
	if size.y < 30:
		n = true
	if n:
		modulate = Color(0,0,0,0)
	pass
