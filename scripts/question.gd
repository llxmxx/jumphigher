extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sword: Sprite2D = $"../player/Sprite2D"
@onready var slime: Node2D = $"../slime"

func _on_body_entered(_body: Node2D) -> void:
	animation_player.play("pickup")
	sword.visible = true
