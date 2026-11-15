extends RigidBody2D

var screen_size: Vector2
var first_touch: Vector2
var release: Vector2

@export var power_multiplier = 5.0
@export var max_power = 10000.0
@export var max_drag = 150.0


@onready var arrow = $Line2D
@onready var arrow_head = $Polygon2D

func _ready():
	Globals.camera = $Camera2D
	screen_size = get_viewport_rect().size

	position = screen_size / 2

	arrow.visible = false
	arrow_head.visible = false


func _physics_process(delta):
	var random_dir = Vector2.from_angle(randf_range(0, TAU)) # or 2 * PI
	linear_velocity = random_dir

	

			
