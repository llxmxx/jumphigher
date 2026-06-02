extends Area2D

@onready var dragon: AnimatedSprite2D = $"../dragon/AnimatedSprite2D"
@onready var dragonc: CharacterBody2D = $"../dragon"

var carrier = dragon
var used = false

var xpos = 15
var ypos = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if carrier:
		global_position = carrier.global_position + Vector2(xpos, ypos)


func _on_body_entered(body: Node2D) -> void:
	if dragonc.asleep and body != dragonc:
		carrier = body
		xpos = 5
		ypos = -10
