extends Node

@onready var game_msg: Label = %game_msg

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("confirm_key"):
		get_viewport().set_input_as_handled()
		if get_tree().paused:
			game_msg.hide()
			get_tree().paused = false
