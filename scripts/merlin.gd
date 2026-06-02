extends Area2D

@onready var key: Area2D = $"../key"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var staff: AnimatedSprite2D = $staff

func _on_body_entered(body: Area2D) -> void:
	print(body.name)
	if body == key:
		animated_sprite_2d.visible = true
		animated_sprite_2d.play("appear")


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite_2d.play("idle")
	staff.visible = true
	staff.play("default")
