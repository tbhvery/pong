extends AudioStreamPlayer

const sounds = {
	0: preload("res://Assets/Taco Bell Bong SFX.ogg"),
	1: preload("res://Assets/vocodes_squidward_10.wav"),
	2: preload("res://Assets/Wow, nicely done! Disney ChannelNickelodeon Laugh Track.mp3")
}

func play_sound(sound_index: int):
	if sounds.has(sound_index):
		stream = sounds[sound_index]
		play()

func _on_ball_ball_collision():
	pitch_scale += 0.4
	play_sound(0)
	
func _on_ball_cpu_score():
	pitch_scale = 1
	play_sound(1)

func _on_ball_user_score():
	pitch_scale = 1
	play_sound(2)
