extends CharacterBody2D

@export var acceleration := 10.0
@export var max_speed := 400.0
@export var rotate_speed := 250.0

func _physics_process(delta):
	var input_vector = Vector2(0,Input.get_axis("move_forward", "move_backward"))
	velocity += input_vector.rotated(rotation) * acceleration
	velocity = velocity.limit_length(max_speed)
	if input_vector.y == 0:
		velocity = velocity.move_toward(Vector2.ZERO, 3)

	if Input.is_action_pressed("rotate_right"):
		rotate(deg_to_rad(rotate_speed*delta))	
	
	if Input.is_action_pressed("rotate_left"):
		rotate(deg_to_rad(-rotate_speed*delta))
		
	move_and_slide()
	var screen_size = get_viewport_rect().size
	
	move_y(screen_size.y)
	move_x(screen_size.x)
	
	

func move_y(screen_height):
	if global_position.y < 0:
		global_position.y = screen_height
	elif global_position.y > screen_height:
		global_position.y = 0

func move_x(screen_width):
	if global_position.x < 0:
		global_position.x = screen_width
	elif global_position.x > screen_width:
		global_position.x = 0
