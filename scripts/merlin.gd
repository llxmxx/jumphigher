extends Node2D

@onready var key: Area2D = $"../key"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var staff: AnimatedSprite2D = $staff
@onready var trigger: Area2D = $trigger
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"../player"
@onready var label_6: Label = $"../labels/Label6"

func _on_trigger_area_entered(area: Area2D) -> void:
	if area == key:
		label_6.visible = true
		animated_sprite_2d.visible = visible
		animated_sprite_2d.play("appear")
		LevelChange.keyused = true
		await animated_sprite_2d.animation_finished
		staff.visible = true
		staff.play("magic")
		animated_sprite_2d.play("idle")
		LevelChange.killslime = true
		timer.start()
		label_6.text = "i'll let u jump onto slimes\nto kill them"

func _on_timer_timeout() -> void:
	staff.visible = false
	label_6.visible = false
	animated_sprite_2d.play("disappear")
	await animated_sprite_2d.animation_finished
	queue_free()
