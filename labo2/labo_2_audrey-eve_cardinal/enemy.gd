extends CharacterBody2D


const SPEED = 100.0

var direction = -1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if not $RayCast2D.is_colliding():
		direction *= -1
		$RayCast2D.target_position.x *= -1

	velocity.x = direction * SPEED

	move_and_slide()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body.current_state == _body.State.ATTACK:
		queue_free()
	else:
		get_tree().reload_current_scene()
		print("RIP")
