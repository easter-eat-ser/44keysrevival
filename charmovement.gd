extends CharacterBody2D

@export var speed = 400
@export var gravity = 10000
@export var airres = 0.99
@export var timescale = 1

func _ready():
	airres = airres * timescale

func get_input(delta):
	var delmod = delta * timescale;
	var input_direction = Input.get_vector("left", "right", "up", "cat")
	velocity = (velocity * airres) + (input_direction * speed)
	if(Input.is_action_just_pressed("tap")):
		velocity = velocity + Vector2(0, -2800)
		print(velocity + Vector2(0, 177 * delmod))
	

func _physics_process(delta):
	get_input(delta)
	var delmod = delta * timescale;
	print(Engine.get_frames_per_second())
	move_and_slide()
	if (!is_on_floor()):
		velocity = velocity + Vector2(0, (gravity * delmod))
