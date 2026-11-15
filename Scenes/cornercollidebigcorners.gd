extends Area2D
@onready var reghit: AudioStreamPlayer = $reghit



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		print("Corner Hit")
		reghit.play()
		Globals.camera.shake(0.40, 30.0, 20.0)
		Globals.score += 1
		if Globals.hit_before_counter > 0:
			Globals.streak += 1
			print("streak + 1")
		Globals.hit_before_counter += 1
		print("hits in a row + 1")
