extends Sprite2D

var textures: Array[Texture2D] = [
		preload("res://Assets/Sprites/DVD.png"),
		preload("res://Assets/Sprites/DVD(Y).png"),
		preload("res://Assets/Sprites/DVD(Pur).png"),
		preload("res://Assets/Sprites/DVD(P).png"),
		preload("res://Assets/Sprites/DVD(O).png"),
		preload("res://Assets/Sprites/DVD(G).png"),
		preload("res://Assets/Sprites/DVD(B).png")
]


func _on_ball_body_entered(body: Node) -> void:
	texture = textures.pick_random()
