extends Node

@onready var scorelabel: Label = $scorelabel
@onready var timer: Timer = $Timer

var score = 0

func add_point():
	score+=1
	scorelabel.text = "you collected " + str(score) + " coins"


func change_level():
	if score >= LevelChange.winscore:
		timer.start()

func _on_timer_timeout() -> void:
	LevelChange.lev+=1
	LevelChange.winscore = 10*LevelChange.lev
	get_tree().change_scene_to_file("res://scenes/level_"+str(LevelChange.lev)+".tscn")
