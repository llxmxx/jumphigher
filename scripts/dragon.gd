extends CharacterBody2D

var speed = 60
var direction = 1
var asleep = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var left_marker: Marker2D = $"../markers/leftMarker"
@onready var right_marker: Marker2D = $"../markers/rightMarker"
@onready var fruit: Area2D = $"../fruit"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var key: Sprite2D = $"../key/Sprite2D"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if not asleep:
		if global_position.x >= right_marker.global_position.x:
			direction = -1;
			animated_sprite_2d.flip_h = true
		elif global_position.x <= left_marker.global_position.x:
			direction = 1;
			animated_sprite_2d.flip_h = false
		velocity.x = speed*direction
		move_and_slide()


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area==fruit and not fruit.carry:
		animated_sprite_2d.play("sleep")
		asleep = true
		if not LevelChange.keyused:
			key.visible = true
		collision_shape_2d.set_deferred("disabled", true)
		fruit.ate()
