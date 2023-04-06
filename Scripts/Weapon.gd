extends Sprite

onready var shoot_sfx = $AudioStreamPlayer

export var delay = 2

var bullet = preload("res://Scenes/Bullet.tscn")
var can_fire = true

func _physics_process(delta):
	var mouse = get_global_mouse_position()
	look_at(mouse)
	
	#print(rad2deg(cos(360-90)))
	#print( deg2rad(abs(rotation_degrees)))
	if abs(rotation_degrees) > 90:
		flip_v = true
	else:
		flip_v = false
	
	if Input.is_action_pressed("attack") and can_fire:
		var bullet_instance = bullet.instance()
		bullet_instance.rotation = rotation
		bullet_instance.position = position
		if shoot_sfx != null:
			shoot_sfx.play()
		get_parent().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(delay),"timeout")
		can_fire = true
	
