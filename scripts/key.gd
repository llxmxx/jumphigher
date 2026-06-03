extends Area2D

@onready var dragon: CharacterBody2D = $"../dragon"
@onready var sprite_2d: Sprite2D = $Sprite2D

var dragon_carry = true
var carrier = null
var used = false

var xpos = 15
var ypos = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if dragon_carry:
		global_position = dragon.global_position + Vector2(xpos, ypos)
	else:
		global_position = carrier.global_position + Vector2(xpos, ypos)

func _on_body_entered(body: Node2D) -> void:
	if dragon.asleep:
		carrier = body
		dragon_carry = false
		xpos = 5
		ypos = -10
