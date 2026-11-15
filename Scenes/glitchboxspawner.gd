extends Node2D

@export var point_1: Vector2 = Vector2(192, 192)
@export var point_2: Vector2 = Vector2(960, 448)


@onready var glitchbox_blueprint: Resource = preload("res://Scenes/glitchbox.tscn")


var Glitchesonline = 0


func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)




func spawn_pickup():
	var glitchbox_instance: Node = glitchbox_blueprint.instantiate()
	add_child(glitchbox_instance)
	
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	
	glitchbox_instance.set_position(spawn_location)
	Glitchesonline += 1
	await get_tree().create_timer(5.0).timeout
	Glitchesonline -= 1
	glitchbox_instance.queue_free()
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("TestSpawn"):
		spawn_pickup()
		print("Test")
	
		
		







func _on_glitchspawn_timeout() -> void:
	if Glitchesonline <= 3:
		spawn_pickup()
