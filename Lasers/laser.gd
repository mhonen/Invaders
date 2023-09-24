extends Area2D

@export var speed := 1000.0

var movement_vector := Vector2(1, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position += movement_vector * speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
