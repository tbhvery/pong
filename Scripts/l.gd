extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if modulate.a > 0:
		modulate.a = lerp(modulate.a, 0.0, delta * 5.0)
	pass

func _on_ball_cpu_score():
	modulate.a = 1
