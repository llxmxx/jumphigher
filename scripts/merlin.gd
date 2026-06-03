extends Node2D

@onready var key: Area2D = $"../key"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var staff: AnimatedSprite2D = $staff
@onready var trigger: Area2D = $trigger
@onready var timer: Timer = $Timer


func _on_trigger_area_entered(area: Area2D) -> void:
	print(area.name)
	if area == key:
		animated_sprite_2d.visible = visible
		animated_sprite_2d.play("appear")
		key.queue_free()
		await animated_sprite_2d.animation_finished
		staff.visible = true
		staff.play("magic")
		animated_sprite_2d.play("idle")
		timer.start()


func _on_timer_timeout() -> void:
	staff.visible = false
	animated_sprite_2d.play("disappear")
	await animated_sprite_2d.animation_finished
	queue_free()
