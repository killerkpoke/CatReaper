extends KinematicBody2D

export var enemy_health = 3

onready var player = get_node("/root/Main/Player")
onready var animated_sprite = $AnimatedSprite

var WALK_SPEED = 90
var GRAVITY = 300

func _physics_process(delta):
	if player:
		var dir = (player.position - position).normalized()
		
		if not is_on_floor():
			dir.y += GRAVITY
			
		if dir.x < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
			
		move_and_slide(dir * WALK_SPEED)
		animated_sprite.animation = "Run"
		
	if enemy_health <= 0:
		queue_free()
		
func _on_EnemyHitbox_area_entered(area):
	if area.name == "Bullet":
		$AudioStreamPlayer.play()
		yield(get_tree().create_timer(0.02),"timeout")
		enemy_health -= 1
