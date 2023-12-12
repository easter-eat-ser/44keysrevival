extends CharacterBody2D

@export var speed = 400
@export var gravity = 10000
@export var airres = 0.99
@export var timescale = 1
var freshjump = 0

func _ready():
	airres = airres * timescale

func get_input(delta):
	var delmod = delta * timescale;
	var input_direction = Input.get_vector("left", "right", "up", "cat")
	velocity = (velocity * airres) + (input_direction * speed)
	if(Input.is_action_pressed("tap")):
		velocity = velocity + Vector2(0, freshjump)
		freshjump = freshjump / 1.2
	if(Input.is_action_just_pressed("tap") && is_on_floor()):
		freshjump = -750
	
	

func _on_area_2d_body_entered(_body):
	$"/root/Node2D/char".set_position(Vector2(-292, -525))
	print("set posiotion")

func _physics_process(delta):
	get_input(delta)
	var delmod = delta * timescale;
	
	move_and_slide()
	if (!is_on_floor()):
		velocity = velocity + Vector2(0, (gravity * delmod))
