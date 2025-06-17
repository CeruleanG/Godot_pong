extends Control

@onready var button: Button = $BoxContainer/HBoxContainer/VBoxContainer/Button

func _ready() -> void:
	self.visible = false

func _on_button_pressed() -> void:
	hide()
