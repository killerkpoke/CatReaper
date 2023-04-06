extends Area2D

export var speed = 100

func _ready():
	pass

func _process(delta):
	position += (Vector2.RIGHT*speed).rotated(rotation) * delta
	
func _physics_process(delta):
	yield(get_tree().create_timer(0.01),"timeout")
	# Animation if we have
	set_physics_process(false)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.name != "Player":
		queue_free()
