extends CharacterBody2D


var SPEED = 600.0
var JUMP_VELOCITY = -450.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("ctrl"):
		$Icon.scale.y = 0.867/2
		$CollisionShape2D.scale.y = 0.5
		SPEED = 350
	
	if Input.is_action_just_pressed("ctrl") and is_on_floor():
		$Icon.position.y += 100
		$CollisionShape2D.position.y += 100
		$Camera2D.position = $Icon.position
	
	if Input.is_action_just_released("ctrl"):
		$Icon.scale.y = 0.867
		$CollisionShape2D.scale.y = 1
		$Camera2D.position = $Icon.position
		SPEED = 600


	var direction = Input.get_axis("a", "d")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



