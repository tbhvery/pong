extends CharacterBody2D
const SPEED = 300
var SCREEN_SIZE

func _ready():
	SCREEN_SIZE = get_viewport_rect().size
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_axis("up", "down")
	position.y += direction * SPEED * delta
	position.y = clamp(position.y, -SCREEN_SIZE.y / 2 + 50, SCREEN_SIZE.y / 2 - 50)
