extends Node2D

const SPEED = 60
var direction = 1
var kill = false

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var die: CollisionShape2D = $killzone/CollisionShape2D
@onready var sword: Area2D = $"../sword"
@onready var timer: Timer = $Timer
@onready var collision: CollisionShape2D = $die/CollisionShape2D2

func _process(delta: float) -> void:
	if kill:
		die.disabled = true
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	
	position.x += SPEED*delta*direction


func _on_die_body_entered(_body: Node2D) -> void:
	animated_sprite_2d.play("die")
	timer.start()

func _on_timer_timeout() -> void:
	sword.queue_free()
	queue_free()
