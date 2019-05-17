extends Area2D

onready var timer = $Timer
onready var collision = $CollisionShape2D

export var speed = 50
export var health = 30

var dead = false

func add_damage(damage):
	health -= damage
	if health <= 0:
		dead = true
		collision.queue_free()
		hide()