extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var key: Area2D = $"../key"

var asleep = false

func sleep():
	animation_player.pause()
	animated_sprite_2d.play("sleep")
	key.visible = true
	asleep = true
