extends Node3D
signal AExterior


func _on_area_3d_area_entered(area):
	if area.is_in_group("Player"):
		
		emit_signal("AExterior")
		
