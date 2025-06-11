extends Node2D

# INFO Basic game mechanic
# A ball is launched to the left from the center top of the screen and bounces
# against any physical object it touches (paddles and horizontal walls).
# The player controls the paddle on the left of the screen which is only able to
# move between rigid walls vertically.
# The AI controls the paddle on the right of the screen which is also only able 
# to move between rigid walls vertically. It alwasys adjust its position to be 
# as close as possible relative to the ball in the vertical axis.
# Whenever the ball touches the left side of the screen, the AI wins a point,
# same for the player if the ball goes to right. In which case, the score is
# updated and the ball is reset to the center of the screen and the game loops.


# TODO Implement a highest score system that saves past progress.
#      It should change the display msg when the player breaks the
#      score.

# TODO After the highest score system is implemented, add a mechanic
#      where the player has 2 lifes to break the highest score. To
#      Implement it, the current score system should be replaced.

@onready var player_score_label: Label = %player_score
var player_score = 0
@onready var enemy_score_label: Label = %enemy_score
var enemy_score = 0

@onready var game_msg: Label = $UI/game_msg


## Resets the position and the velocity of ball object
## and then pause the game.
func reset_the_scene() -> void:
	get_node("ball").position = Vector2(320,120)
	get_node("ball")._ready()
	_ready()
	

func _ready() -> void:
	player_score_label.text = "Your score = " + str(player_score)
	enemy_score_label.text = "Enemy score = " + str(enemy_score)
	game_msg.show()
	game_msg.text = "Press Space to Start"
	get_tree().paused = true

# Triggered upon the the ball touches the left/right side of the screen, which is 
# defined as an "area2D" object. The latter emits a signal to call this function
func _on_enemy_score() -> void:
	enemy_score+=1
	enemy_score_label.text = "Enemy score = " + str(enemy_score)
	reset_the_scene()

func _on_player_score() -> void:
	player_score+=1
	player_score_label.text = "Your score = " + str(player_score)
	reset_the_scene()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm_key") :
		#Pause the game upon pressing the space key
		game_msg.show()
		game_msg.text = "Paused"
		get_tree().paused = true
			
