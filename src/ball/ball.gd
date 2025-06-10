extends CharacterBody2D

const SPEED := 4.0

func _ready() -> void:
	var dir := Vector2(-1,1).normalized()
	velocity = dir * SPEED
	
func _physics_process(delta: float) -> void:
	var col := move_and_collide(velocity)
	if (abs(velocity.x)<1.5):
		velocity.x *= 1.05
	#print_debug(velocity.x)
	if col:
		#print_debug("ball collided")
		velocity = velocity.bounce(col.get_normal())
		velocity *= 1.05
		print_debug(velocity)
