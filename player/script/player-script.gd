extends CharacterBody2D


const SPEED = 200


func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	get_player_movement(InputEvent, delta)
	move_and_slide()

func get_player_movement(InputEvent, delta):
	velocity = Vector2()
	if Input.is_action_pressed("up"):
		velocity.y = -40 * SPEED*delta
	if Input.is_action_pressed("down"):
		velocity.y = 40 * SPEED*delta
	if Input.is_action_pressed("left"):
		velocity.x = -40 * SPEED*delta
	if Input.is_action_pressed("right"):
		velocity.x = 40 * SPEED*delta
	
	velocity.normalized() * SPEED * delta
	
