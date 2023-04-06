extends Node2D

onready var Enemy = preload("res://Scenes/Enemy.tscn")
onready var timer = $Timer

const MAX_RANGE = 600
export var delay = 5 

func _ready():
	timer.wait_time = self.delay

func spawn():
	var Player = get_node("/root/Main/Player")
	var enemy_instance = Enemy.instance()
	var pos = Player.position
	
	if randf() < 0.5:
		pos.x -= rand_range(MAX_RANGE/2, MAX_RANGE)
	else:
		pos.x += rand_range(MAX_RANGE/2, MAX_RANGE)
	
	enemy_instance.position = pos
	add_child(enemy_instance)
	
func set_delay(value):
	if self.delay > 0.75:
		self.delay -= value
		timer.wait_time = self.delay
	
func _on_Timer_timeout():
	spawn()
	set_delay(0.25)
