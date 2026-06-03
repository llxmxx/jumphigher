extends Area2D

@onready var dragon: CharacterBody2D = $"../dragon" 
@onready var player: CharacterBody2D = $"../player"
@onready var detection_area: Area2D = $"../dragon/AnimatedSprite2D/detectionArea"

var carry = false
var carrier = null
var body_in = false

func _process(_delta: float) -> void:
	if body_in and Input.is_action_just_pressed("pickdrop"):
		if carry:
			carry = false
			carrier = null
		else:
			carry = true
	if carry and carrier:
		global_position = carrier.global_position + Vector2(8, -10)

func _on_body_entered(body: Node2D) -> void:
	if body == player:
		body_in = true
		carrier = body

func _on_body_exited(body: Node2D) -> void:
	if body == player:
		body_in = false

func ate():
	queue_free()
