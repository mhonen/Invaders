extends CharacterBody2D

signal laser_shot(laser)

@onready var muzzle = $Muzzle
var laser_scene = preload("res://Lasers/laser.tscn")

var speed = 300

# Needed to add the ready function so thruster animation will work.
# Probably will use a onready variable later to get rid of funtion
func _ready() -> void:
	$Thrusters/AnimationPlayer.play("thrust")
	
func _process(delta):
	
	move(delta)
	
	if Input.is_action_just_pressed("shoot"):
		shoot_laser()
	
func move(delta):
	if Input.is_action_pressed("left"):
		position.x -= speed * delta 
	if Input.is_action_pressed("right"):
		position.x += speed * delta
	if Input.is_action_pressed("up"):
		position.y -= speed * delta
	if Input.is_action_pressed("down"):
		position.y += speed * delta
	move_and_slide()
	
	# Keeps player on the screen using clamp.
	var viewRect = get_viewport_rect()
	position.x = clamp(position.x, 200, viewRect.size.x - 200)
	position.y = clamp(position.y, 150, viewRect.size.y - 150)

func shoot_laser():
	var l = laser_scene.instantiate()
	l.global_position = muzzle.global_position
	emit_signal("laser_shot", l)
	
	
	
