extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogicHandeler.dialogo("timelineOficina")

func _process(delta):
	if Global.aLobby:
		salir()

func salir():
	Global.aLobby = false
	$AnimationPlayer.play("fadeOut")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeOut":
		get_tree().change_scene_to_file("res://Scenes/lobby.tscn")
	
