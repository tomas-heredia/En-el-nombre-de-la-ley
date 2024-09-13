extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureRect/Button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame


func _on_button_button_up():
	
	get_tree().change_scene_to_file("res://Scenes/exterior.tscn")
	
