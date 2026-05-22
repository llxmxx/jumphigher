extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var slime: Node2D = $"../slime"
@onready var sword: Area2D = $"../sword"

func _on_body_entered(body: Node2D) -> void:
	animation_player.play("pickup")
	slime.kill = true
	body.has_sword = true
	sword.visible = true
