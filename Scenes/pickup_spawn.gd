extends Node2D

@export var point_1: Vector2 = Vector2(192, 192)
@export var point_2: Vector2 = Vector2(960, 448)


@onready var pickup_blueprint: Resource = preload("res://Scenes/glitchtriangle.tscn")
@onready var warning_blueprint: Resource = preload("res://Scenes/glitch_triangle_warning.tscn")

var EnemiesAlive = 0
var difficulty = 5

func get_random_point_inside(p1: Vector2, p2: Vector2) -> Vector2:
	var x_value: float = randf_range(p1.x, p2.x)
	var y_value: float = randf_range(p1.y, p2.y)
	
	var random_point_inside: Vector2 = Vector2(x_value, y_value)
	
	return(random_point_inside)




func spawn_pickup():
	var pickup_instance: Node = pickup_blueprint.instantiate()
	add_child(pickup_instance)
	var warning_instance: Node = warning_blueprint.instantiate()
	add_child(warning_instance)
	var spawn_location: Vector2 = get_random_point_inside(point_1, point_2)
	warning_instance.set_position(spawn_location)
	await get_tree().create_timer(2.0).timeout
	warning_instance.queue_free()
	pickup_instance.set_position(spawn_location)
	EnemiesAlive += 1
	await get_tree().create_timer(5.0).timeout
	EnemiesAlive -= 1
	pickup_instance.queue_free()
	print("Spawned: ", pickup_instance.name)
	print("Position: ", pickup_instance.position)
	print("Visible: ", pickup_instance.visible)
	print(pickup_instance.get_children())
	print(pickup_instance.is_visible_in_tree())
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("TestSpawn"):
		spawn_pickup()
		print("Test")
	
		
		



func _on_timer_timeout() -> void:
	if EnemiesAlive < difficulty:
		spawn_pickup()
		print("Enemy Spawned!")


func _on_difficulty_timer_timeout() -> void:
	difficulty += 1
	print("Difficulty Increased")
