extends CharacterBody2D

const speed = 60
var direction = 1
var dead = false

@onready var player: CharacterBody2D = $"../player"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $killzone
@onready var left_marker_slime: Marker2D = $"../markers/leftMarkerSlime"
@onready var right_marker_slime: Marker2D = $"../markers/rightMarkerSlime"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _process(_delta: float) -> void:
	if LevelChange.killslime:
		collision_shape_2d.disabled = false
	if not dead:
		if global_position.x >= right_marker_slime.global_position.x:
			direction = -1;
			animated_sprite_2d.flip_h = true
		elif global_position.x <= left_marker_slime.global_position.x:
			direction = 1;
			animated_sprite_2d.flip_h = false
		velocity.x = speed*direction
		move_and_slide()


func _on_diearea_body_entered(body: Node2D) -> void:
	if body == player and LevelChange.killslime == true:
		killzone.monitoring=false
		dead = true
		animated_sprite_2d.play("die")
		await animated_sprite_2d.animation_finished
		queue_free()
