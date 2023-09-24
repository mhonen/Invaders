extends ParallaxBackground

var SPEED = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll(delta)
	
func scroll(delta: float):
	scroll_base_offset -= Vector2(SPEED, 0) * delta
