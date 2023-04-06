extends Control

onready var music_btn = $Panel/MusicBtn
onready var pause_icon = preload("res://GameAssets/Sprites/UI/WenrexaUIMobileN4_OnlyPng/PNG/Icon65.png")
onready var play_icon = preload("res://GameAssets/Sprites/UI/WenrexaUIMobileN4_OnlyPng/PNG/Icon90.png")

onready var music_player = $"/root/BackgroundMusic"

onready var anim_player = $AnimationPlayer

export var magnitude = 1.4
export var anim_delay = 0.3

func _ready():
	if music_player.stream_paused:
		music_btn.texture_normal = play_icon
	else:
		music_btn.texture_normal = pause_icon
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	anim_player.play("initAnim")
	yield(get_tree().create_timer(5), "timeout")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

func _on_PlayBtn_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")

func _on_ExitBtn_pressed():
	get_tree().quit()

func _on_PlayBtn_mouse_entered():
	anim_player.play("FocusInPlay")

func _on_PlayBtn_mouse_exited():
	anim_player.play_backwards("FocusInPlay")
	
func _on_ExitBtn_mouse_entered():
	anim_player.play("FocusInExit")

func _on_ExitBtn_mouse_exited():
	anim_player.play_backwards("FocusInExit")

func _on_MusicBtn_pressed():
	music_player.stream_paused = !music_player.stream_paused
	if music_player.stream_paused:
		music_btn.texture_normal = play_icon
	else:
		music_btn.texture_normal = pause_icon
	
