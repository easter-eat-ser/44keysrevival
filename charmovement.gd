extends CharacterBody2D

@export var speed = 400
@export var gravity = 1000
@export var airres = 0.99

func get_input():
	var input_direction = Input.get_vector("left", "right", "cat", "cat")
	velocity = (velocity * airres) + (input_direction * speed)
	if(Input.is_action_just_pressed("tap")): {
		velocity = velocity + Vector2(0, 50)
	}

func _physics_process(delta):
	get_input()
	move_and_slide()
	if (!is_on_floor()):
		velocity = velocity + Vector2(0, (gravity * delta))
