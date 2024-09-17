extends Node3D
var interactuando :bool = false
var interactuable :bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Label.position.x = $Marker3D.position.x
	$Label.position.y = $Marker3D.position.y
	$Label.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if interactuable:
		if Input.is_action_just_pressed("Interact") and ! Global.get_interactuando():
			DialogicHandeler.dialogo("timelinePrueva2")
		





func _on_interaccion_area_entered(area):
	interactuable = true
	$Label.visible = true


func _on_interaccion_area_exited(area):
	interactuable = false
	$Label.visible = false
