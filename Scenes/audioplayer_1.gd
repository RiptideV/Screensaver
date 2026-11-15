extends Node2D

@onready var perfecthit: AudioStreamPlayer = $Perfecthit



func play_perfect_hit():
	perfecthit.play()
