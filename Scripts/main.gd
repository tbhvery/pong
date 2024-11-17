extends Node

var score = 0
var cpu_score = 0

func _on_ball_user_score():
	score += 1
	$"User Interface/User Score".text = str(score)

func _on_ball_cpu_score():
	cpu_score += 1
	$"User Interface/CPU Score".text = str(cpu_score)
