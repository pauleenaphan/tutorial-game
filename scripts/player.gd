extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# input direction could be -1, 0 or 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# based on direction we flip the sprite 
	if direction > 0:
		animated_sprite.flip_h = false;
	elif direction < 0:
		animated_sprite.flip_h = true;
		
	# plays animations for our character
	# if we are on the floor then we do floor animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run");
	else: #if we aren't on the floop we can do the jump animation
		animated_sprite.play("jump")
		
	# applies movement to our sprite
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
