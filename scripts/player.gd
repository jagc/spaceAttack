extends KinematicBody2D

const SPEED = 500

var screen_size

func _ready():
	screen_size = get_viewport_rect().size.x
	
func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
	elif Input.is_action_pressed("right"):
		position.x += SPEED * delta
	elif Input.is_action_just_pressed("close"):
		get_tree().quit()
    
	position.x = clamp(position.x, 0, screen_size)