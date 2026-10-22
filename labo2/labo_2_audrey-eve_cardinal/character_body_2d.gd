extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum State {
	STANDING,
	RUN,
	JUMP,
	ATTACK
}

var current_state = State.STANDING
@onready var animated_sprite = $AnimatedSprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	#Machine à états

	var direction := Input.get_axis("left", "right")

	if Input.is_action_pressed("attack"):
		current_state = State.ATTACK

	elif not is_on_floor():
		current_state = State.JUMP

	elif direction != 0:
		current_state = State.RUN

	else:
		current_state = State.STANDING
		
	match current_state:
		State.STANDING:
			animated_sprite.play("standing")
		State.RUN:
			animated_sprite.play("run")
		State.JUMP:
			animated_sprite.play("jump")
		State.ATTACK:
			animated_sprite.play("attack")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
