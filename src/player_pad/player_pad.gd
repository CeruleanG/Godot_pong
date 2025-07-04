extends CharacterBody2D

const SPEED := 300
const X_POS = 40

func get_input_dir () -> float :
	return Input.get_action_strength("down_key") - Input.get_action_strength("up_key")
	# 1 if down/s key is pressed and 0 if up/w key is pressed

func _physics_process(delta: float) -> void:
	var dir := Vector2(0, get_input_dir())
	var velocity = dir * SPEED * delta
	move_and_collide(velocity)
	self.position.x = X_POS
	
