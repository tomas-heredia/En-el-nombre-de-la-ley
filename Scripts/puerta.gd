extends Node3D
signal cambiar

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_area_3d_area_entered(area):
	if area.is_in_group("Player"):
		
		emit_signal("cambiar")
		
