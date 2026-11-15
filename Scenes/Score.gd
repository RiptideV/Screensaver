extends RichTextLabel
# Called when the node enters the scene tree for the first time.

@onready var streakup: AudioStreamPlayer = $Streakup


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.streak >= Globals.next_milestone:
		Globals.multiplier += 1
		Globals.next_milestone += 1
		Globals.milestones_completed += 1
		streakup.play()
	if Globals.milestones_completed < 2:
		text = "SCORE: " + "[color=#639bff]" + str(Globals.score * Globals.multiplier) + "[/color]" + "[br]" + "MULT:  " + "[color=#ff8c5c]" + str(Globals.multiplier) + "[/color]"
	if Globals.milestones_completed >= 1 and Globals.milestones_completed <= 3:
		text = "SCORE: " + "[color=#639bff]" + str(Globals.score * Globals.multiplier) + "[/color]" + "[br]" + "MULT:  " + "[color=#ff8c5c]" + "[wave amp=50]" + str(Globals.multiplier) + "[/wave]" + "[/color]" 
	if Globals.milestones_completed >= 4 and Globals.milestones_completed <= 6:
		text = "SCORE: " + "[color=#639bff]" + str(Globals.score * Globals.multiplier) + "[/color]" + "[br]" + "MULT:  " + "[color=#ff8c5c]" + "[wave amp=50 freq=5]" + str(Globals.multiplier) + "[/wave]" + "[/color]" 
	if Globals.milestones_completed >= 7 and Globals.milestones_completed <= 9:
		text = "SCORE: " + "[color=#639bff]"+ "[wave amp=50 freq=5]" + str(Globals.score * Globals.multiplier) + "[/wave]" + "[/color]" + "[br]" + "MULT:  " + "[color=#ff8c5c]" + "[shake]" + str(Globals.multiplier) + "[/shake]" + "[/color]" 
	if Globals.milestones_completed >= 10 and Globals.milestones_completed <= 12:
		text = "SCORE: " + "[color=#639bff]"+ "[shake]" + str(Globals.score * Globals.multiplier) + "[/shake]" + "[/color]" + "[br]" + "MULT:  " + "[color=#ff8c5c]" + "[rainbow]" + str(Globals.multiplier) + "[/rainbow]" + "[/color]" 
	
