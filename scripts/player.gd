extends KinematicBody2D

export(PackedScene) var projectile
export var health = 30

const SPEED = 500

var screen_size
var half_sprite_size
var can_shoot = true
var dead = false

onready var sprite = $Sprite
onready var timer = $Timer
onready var deathTimer = $deathTimer

func _ready():
	screen_size = get_viewport_rect().size.x
	half_sprite_size = sprite.texture.get_width() * scale.x / 2
	
func _process(delta):
	if Input.is_action_pressed("left"):
		position.x -= SPEED * delta
	elif Input.is_action_pressed("right"):
		position.x += SPEED * delta
	if Input.is_action_just_pressed("close"):
		get_tree().quit()
		
	if can_shoot and Input.is_action_pressed("shoot"):
		can_shoot = false
		var new_projectile = projectile.instance()
		get_parent().add_child(new_projectile)
		new_projectile.position = position
		timer.start()
    
	position.x = clamp(position.x, 0 + half_sprite_size, screen_size - half_sprite_size)

func _on_Timer_timeout():
	can_shoot = true

func add_damage(damage):
	if dead:
		return
	health -= damage
	if health <= 0:
		dead = true
		health = 0
		deathTimer.start()
		set_process(false)
		sprite.queue_free()
		
func _on_deathTimer_timeout():
	get_tree().reload_current_scene()
