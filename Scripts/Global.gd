extends Node
var moverse :bool = true
var interactuando :bool
var aLobby :bool
var interactionWait : bool
# Called when the node enters the scene tree for the first time.
func _ready():
	interactionWait = false
	aLobby == false
	Dialogic.signal_event.connect(_on_dialogic_signal)
	interactuando = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interaccion():
	
	interactuando = !interactuando
	

func get_interactuando():
	return interactuando

func _on_dialogic_signal(argument:String):
	
	if argument =="termino":
		interaccion()
	elif argument =="ALobby":
		aLobby = true
		
