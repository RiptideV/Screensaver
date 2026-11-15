
extends Camera2D

var _duration = 0.0
var _period_in_ms = 0.0
var _amplitude = 0.0
var _timer = 0.0
var _last_shook_timer = 0.0

var _previous_x = 0.0
var _previous_y = 0.0

var _original_offset = Vector2.ZERO
var _shake_offset = Vector2.ZERO

func _ready():
	_original_offset = offset
	set_process(true)


func _process(delta):
	if _timer <= 0.0:
		return

	_last_shook_timer += delta

	while _last_shook_timer >= _period_in_ms:
		_last_shook_timer -= _period_in_ms

		var intensity = _amplitude * (_timer / _duration)

		var new_x = randf_range(-1.0, 1.0)
		var new_y = randf_range(-1.0, 1.0)

		var x_component = lerpf(_previous_x, new_x, minf(delta * 60.0, 1.0))
		var y_component = lerpf(_previous_y, new_y, minf(delta * 60.0, 1.0))

		_previous_x = x_component
		_previous_y = y_component

		_shake_offset = Vector2(
			x_component * intensity,
			y_component * intensity
		)

		offset = _original_offset + _shake_offset

	_timer -= delta

	if _timer <= 0.0:
		_timer = 0.0
		_shake_offset = Vector2.ZERO
		offset = _original_offset


func shake(duration, frequency, amplitude):
	if duration <= 0.0 or frequency <= 0.0:
		return

	_duration = duration
	_timer = duration
	_period_in_ms = 1.0 / frequency
	_amplitude = amplitude

	_previous_x = randf_range(-1.0, 1.0)
	_previous_y = randf_range(-1.0, 1.0)

	_shake_offset = Vector2.ZERO
	offset = _original_offset
	_last_shook_timer = 0.0
