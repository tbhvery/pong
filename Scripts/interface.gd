extends Control

func _draw():
	var rect = Rect2(Vector2.ZERO, Vector2(800,600))
	draw_rect(rect, Color.WHITE, false, 10.0)
