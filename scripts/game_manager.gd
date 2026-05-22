extends Node

@onready var scorelabel: Label = $scorelabel
@onready var timer: Timer = $Timer

var score = 0
var lev = 1
var winscore = 10*lev

func add_point():
	score+=1
	scorelabel.text = "you collected " + str(score) + " coins"

func change_level():
	if score >= winscore:
		timer.start()

func _on_timer_timeout() -> void:
	lev+=1
	get_tree().change_scene_to_file("res://scenes/level_"+str(lev)+".tscn")
