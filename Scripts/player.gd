extends CharacterBody2D
const SPEED = 300
var SCREEN_SIZE = Vector2(800, 600)

func _process(delta):
	var direction = Input.get_axis("up", "down")
	position.y += direction * SPEED * delta
	position.y = clamp(position.y, -SCREEN_SIZE.y / 2 + 55, SCREEN_SIZE.y / 2 - 55)
