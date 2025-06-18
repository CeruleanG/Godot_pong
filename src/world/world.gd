extends Node2D


@onready var high_score_label: Label = %high_score
var high_score = 0.0
@onready var current_score_label : Label = %current_score
var current_score = 0.0

@onready var game_msg: Label = $UI/game_msg

@onready var life: TextureRect = %life
var another_life = true
var red_rect = Rect2(2,20,13,12)
var black_rect = Rect2(78,20,13,12)

@onready var paused_menu: Control = %Paused_Menu


const score_bonus = 20



# path to save the high score through multiple boots
var save_path = "user://high_score.save"

## Resets the score and checks the highscore if necessary. Then resets position
## and the velocity of ball object before pausing the game.
func reset_the_scene(win : bool) -> void:
	var msg = "Press space to start!"
	if win :
		# add scoring bonus and keep playing
		current_score += score_bonus
		current_score_label.text = "Current score = " + str(int(current_score)).pad_zeros(8)
		msg = "You scored a bonus! Press on!\n" + msg
	else:	
		# check for high score and reset current score
		if another_life :
			msg = "You have one more chance!\n" + msg
			life.texture.region = black_rect
			another_life = false
		else:
			msg = "Your run stops here.\n" + msg
			if current_score > high_score :
				high_score = current_score
				high_score_label.text = "High score = " + str(int(high_score)).pad_zeros(8)
				save_high_score()
				msg = "But you scored high!\n" + msg
			current_score = 0.0
			current_score_label.text = "Current score = " + str(int(current_score)).pad_zeros(8)
			life.texture.region = red_rect
			another_life = true
		msg = "You missed...\n" + msg
		
	get_node("ball").position = Vector2(320,120)
	get_node("ball")._ready()
	pause_with_msg(msg)
	

func _ready() -> void:
	load_high_score()
	high_score_label.text = "High score = " + str(int(high_score)).pad_zeros(8)
	current_score_label.text = "Current score = " + str(int(current_score)).pad_zeros(8)
	pause_with_msg("Press Space to start")

# Triggered upon the the ball touches the left/right side of the screen, which is 
# defined as an "area2D" object. The latter emits a signal to call this function
func _on_enemy_score() -> void:
	$ball.goal_audio()
	reset_the_scene(false)
func _on_player_score() -> void:
	$ball.goal_audio()
	reset_the_scene(true)

func _process(delta: float) -> void:
	current_score += delta * 5
	current_score_label.text = "Current score = " + str(int(current_score)).pad_zeros(8)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm_key") :
		#Pause the game upon pressing the space key
		pause_with_msg("Game Paused")
			

func save_high_score():
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(high_score)

func load_high_score():
	if FileAccess.file_exists(save_path) :
		var file = FileAccess.open(save_path,FileAccess.READ)
		high_score = file.get_var(high_score)
	else:
		print_debug("no save file")
		high_score = 0.0

## Pause the game while displaying "msg" on screen
func pause_with_msg(msg : String = "") -> void :
	game_msg.show()
	game_msg.text = msg
	get_tree().paused = true


func _on_how_to_play_pressed() -> void:
	paused_menu.show()
	pause_with_msg("Game Paused")
