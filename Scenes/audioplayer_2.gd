extends Node2D

@onready var reghit = get_node_or_null("reghit")

func _ready():
	print("AudioManager2 loaded")
	print("Regular hit: ", reghit)

func play_reg_hit():
	if reghit == null:
		print("ERROR: reghit is NULL")
		return

	reghit.play()
