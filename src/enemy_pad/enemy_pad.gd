extends CharacterBody2D

const SPEED := 200
var ball : CharacterBody2D

func _ready() -> void:
	ball = get_parent().get_node("ball")
	
func _physics_process(delta: float) -> void:
	var diff = ball.global_position.y - global_position.y
	var aim = 0
	if abs(diff)>3 :
		aim = sign(diff)
	var dir := Vector2(0, aim)
	var velocity = dir * SPEED * delta
	move_and_collide(velocity)
