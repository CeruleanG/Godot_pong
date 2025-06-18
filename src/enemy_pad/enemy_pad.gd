extends CharacterBody2D

const SPEED := 200
var ball : CharacterBody2D

func _ready() -> void:
	ball = get_parent().get_node("ball")
	
func _physics_process(delta: float) -> void:
	var aim = sign(ball.global_position.y - global_position.y)
	var dir := Vector2(0, aim)
	var velocity = dir * SPEED * delta
	move_and_collide(velocity)
