extends CharacterBody2D

const SPEED := 200

func _ready() -> void:
	var dir := Vector2(-1,1).normalized()
	velocity = dir * SPEED
	
func _physics_process(delta: float) -> void:
	var col := move_and_collide(velocity * delta)
	if (abs(velocity.x)<1.5):
		velocity.x *= 1.01
		# TODO Delete this velocity modifier
	if col:
		velocity = velocity.bounce(col.get_normal())
		$bounce_SFX.play()
		velocity *= 1.05

func  goal_audio() :
	$goal_SFX.play()
