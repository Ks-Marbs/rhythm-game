extends ColorRect
var place := 1
var on = false
var b := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size = Vector2(1,(position[0]+self.get_parent().position[0])*-2+13)
	if b % 10 == 0 and self.get_parent().cot != 100 and self.get_parent().held and\
	position[0]+self.get_parent().position[0] > self.get_parent().cot and !on:
		Global.score += self.get_parent().sco
		on = true
	if !self.get_parent().held and self.get_parent().caught:
		self_modulate=Color(0.0, 0.0, 0.0, 0.2)
	pass
