extends Node2D
@onready var backgroundmusic: AudioStreamPlayer = $Backgroundmusic
@onready var timer: Timer = $UI/Timecounter/Timer

@onready var tutorialtext = get_node("UI/tutorialtext")
@onready var tutorialexitbutton = get_node("UI/tutorialtext/closetutorial")
# Show the label
var tutorialtextclosed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true
	tutorialtext.visible = true
	Globals.camera = $Camera2D

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_closetutorial_pressed() -> void:
	print("close button pressed")
	get_tree().paused = false
	tutorialtext.visible = false
	timer.start()
