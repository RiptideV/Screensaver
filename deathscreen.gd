extends Node2D

@onready var malfunction: AudioStreamPlayer = $Malfunction

@onready var soundeffect: AudioStreamPlayer = $soundeffect



func _ready():
	Globals.score = 0
	Globals.streak = 0
	Globals.multiplier = 0
	Globals.hit_before_counter = 0
	Globals.milestones_completed = 0
	Globals.next_milestone = 0
	soundeffect.play()
	await get_tree().create_timer(0.2).timeout
	malfunction.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.






func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
