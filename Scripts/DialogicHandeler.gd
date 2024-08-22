extends Node

var hablando :bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func dialogo(nombre):
	hablando = true
	Dialogic.timeline_ended.connect(ended)
	Dialogic.start(nombre)

func ended():
	Dialogic.timeline_ended.disconnect(ended)
	print("ended")
	hablando = false
