extends Node2D

@onready var player: CharacterBody2D = $"../player"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var killzone: Area2D = $killzone

func _on_diearea_body_entered(body: Node2D) -> void:
	if body == player and player.kills == true:
		killzone.monitoring=false
		animation_player.pause()
		animated_sprite_2d.play("die")
		await animated_sprite_2d.animation_finished
		queue_free()
