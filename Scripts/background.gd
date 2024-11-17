extends ColorRect

var default_color = Color(0.1, 0.1, 0.1)
var current_color = default_color
var transition_speed = 10

var colors = [
	Color(0.3, 0.2, 0.2),  # Reddish
	Color(0.2, 0.3, 0.2),  # Greenish
	Color(0.2, 0.2, 0.3),  # Bluish
	Color(0.3, 0.3, 0.2),  # Yellowish
	Color(0.3, 0.2, 0.3),  # Purplish
]

# Called when the node enters the scene tree for the first time.

func _process(delta):
	color = color.lerp(current_color, delta * transition_speed)

func _on_ball_ball_collision():
	var flash_color = colors[randi() % colors.size()]
	color = flash_color
	current_color = default_color
