extends CharacterBody2D

signal ball_collision
signal user_score
signal cpu_score

@export var SPEED = 200.0
@export var RAND_DEVIATION = 10
var SCREEN_SIZE

func _ready():
	SCREEN_SIZE = get_viewport_rect().size
	velocity.x = -SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if (collision):
		var collider = collision.get_collider()
		if collider.is_in_group("paddle"):
			emit_signal("ball_collision")
			handle_on_hit_paddle(collider)
			if (abs(velocity.x) < 800):
				velocity.x *= 1.1
				print(velocity.x)
		velocity = velocity.bounce(collision.get_normal())
	if (position.x > SCREEN_SIZE.x / 2 - 10 || position.x < -SCREEN_SIZE.x / 2 + 10):
		velocity.x = -velocity.x
	if (position.y > SCREEN_SIZE.y / 2 - 10 || position.y < -SCREEN_SIZE.y / 2 + 10):
		velocity.y = -velocity.y

func handle_on_hit_paddle(paddle):
	var paddle_center = paddle.global_position
	var hit_pos = global_position

	var relative_hit = hit_pos.y - paddle_center.y
	var deflection_angle = relative_hit * (60 * PI/180) + randf_range(-RAND_DEVIATION, RAND_DEVIATION)
	if (abs(velocity.y) < 300):
		velocity.y += deflection_angle * 5
	
func _on_computer_goal_body_entered(area):
	emit_signal("cpu_score")
	print("Computer Scores")
	_reset_ball()

func _on_user_goal_body_entered(area):
	emit_signal("user_score")
	print("User Scores")
	_reset_ball()

func _reset_ball():
	position = Vector2(0, 0)
	velocity.x = -SPEED * velocity.x / abs(velocity.x)
	velocity.y = 0
