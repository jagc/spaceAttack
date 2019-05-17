extends KinematicBody2D

const SPEED = 500

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
	elif Input.is_action_pressed("right"):
		position.x += SPEED * delta
    