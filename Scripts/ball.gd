extends RigidBody2D

var screen_size: Vector2
var first_touch: Vector2
var release: Vector2
@onready var hit: AudioStreamPlayer2D = $hit

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

	if Input.is_action_just_pressed("Click"):
		first_touch = get_global_mouse_position()
		Engine.time_scale = 0.25
		arrow.visible = true
		arrow_head.visible = true

	if Input.is_action_pressed("Click"):
		release = get_global_mouse_position()

		var drag = first_touch - release
		var strength = min(drag.length(), max_drag)

		# Direction and length of arrow
		var direction = drag.normalized()
		var arrow_end = direction * strength

		# Draw arrow shaft
		arrow.points = [
			Vector2.ZERO,
			arrow_end - direction * 20
		]

		# Draw arrow head
		var perpendicular = Vector2(
			-direction.y,
			direction.x
		)

		arrow_head.polygon = PackedVector2Array([
			arrow_end,
			arrow_end - direction * 20 + perpendicular * 10,
			arrow_end - direction * 20 - perpendicular * 10
		])

		arrow_head.position = Vector2.ZERO

	if Input.is_action_just_released("Click"):
		release = get_global_mouse_position()
		Engine.time_scale = 1
		var drag = first_touch - release
		var strength = min(drag.length(), max_drag)

		var direction = drag.normalized()
		
		var current_speed = linear_velocity.length()
		var launch_power = min(strength * power_multiplier, max_power)

		var new_speed = current_speed + launch_power * 0.5

		linear_velocity = direction * new_speed
		

		arrow.visible = false
		arrow_head.visible = false
	

			


func _on_body_entered(body: Node) -> void:
	Globals.camera.shake(0.20, 15.0, 10.0)
	Globals.hit_before_counter = 0
	hit.play()
	
