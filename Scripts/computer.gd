extends CharacterBody2D
var ball: Node2D
var SCREEN_SIZE = Vector2(800, 600)

@export var ai_speed = 50
@export var max_ai_speed = 100

func _ready():
	ball = get_node("../Ball")
	SCREEN_SIZE = get_viewport_rect().size

func _physics_process(delta):
	var ball_y = ball.position.y
	var target_y = lerp(position.y, ball_y, 0.001 * ai_speed)
	
	position.y = target_y
	position.y = clamp(position.y, -SCREEN_SIZE.y / 2 + 55, SCREEN_SIZE.y / 2 - 55)

func _on_ball_user_score():
	if ai_speed < max_ai_speed:
		ai_speed += 10
	pass # Replace with function body.
