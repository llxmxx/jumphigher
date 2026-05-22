extends Area2D

@onready var game_manager: Node = %"game manager"

func _on_body_entered(body: Node2D) -> void:
	if body.velocity.y >= 0:
		game_manager.change_level()
