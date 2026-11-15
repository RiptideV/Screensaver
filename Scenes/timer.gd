extends Label

var total_time_in_seconds: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	total_time_in_seconds += 1
	var m = int(total_time_in_seconds / 60.0)
	var s = total_time_in_seconds - m * 60
	$".".text = '%02d:%02d' % [m, s]
