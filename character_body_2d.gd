extends CharacterBody2D


const SPEED = 300.0


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()

func get_player_movement(InputEvent, delta):
	if InputEvent == Input.is_action_pressed("up"):
		velocity.y -= SPEED
	if InputEvent == Input.is_action_pressed("down"):
		velocity.y += SPEED
	if InputEvent == Input.is_action_pressed("left"):
		velocity.x -= SPEED
	if InputEvent == Input.is_action_pressed("right"):
		velocity.x += SPEED
	
	else:
		velocity.move_toward(velocity,0)
	
