extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Puerta.connect("cambiar",cambiar)
	$AnimationPlayer.play("fadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func cambiar():
	Global.moverse = false
	$AnimationPlayer.play("fadeOut")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeOut":
		get_tree().change_scene_to_file("res://Scenes/lobby.tscn")
