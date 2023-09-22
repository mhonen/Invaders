extends CharacterBody2D

var speed = 300

func _process(delta):
	
	if Input.is_action_pressed("left"):
		position.x -= speed * delta 
	if Input.is_action_pressed("right"):
		position.x += speed * delta
	if Input.is_action_pressed("up"):
		position.y -= speed * delta
	if Input.is_action_pressed("down"):
		position.y += speed * delta
	
	move_and_slide()
