extends Node2D

@onready var player_score_label: Label = %player_score
@onready var enemy_score_label: Label = %enemy_score
@onready var game_msg: Label = $UI/game_msg

var player_score = 0
var enemy_score = 0


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
		game_msg.show()
		game_msg.text = "Paused"
		get_tree().paused = true
			
