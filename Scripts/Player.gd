extends CharacterBody3D

@onready var navegationAgent := $NavigationAgent3D
const SPEED = 50.0


func _physics_process(delta):
	if navegationAgent.is_navigation_finished():
		pass
	
	mover(delta)



func _input(event):
	if Input.is_action_just_pressed("LeftClick"):
		var camera = get_tree().get_nodes_in_group("camara")[0]
		var mousePosition = get_viewport().get_mouse_position()
		var rayLength = 100
		var from = camera.project_ray_origin(mousePosition)
		var to = from + camera.project_ray_normal(mousePosition) * rayLength
		var space = get_world_3d().direct_space_state
		var rayQuery = PhysicsRayQueryParameters3D.new()
		rayQuery.from = from
		rayQuery.to = to
		rayQuery.collide_with_areas = true
		var result = space.intersect_ray(rayQuery)
		print(result)
		
		navegationAgent.target_position = result.position

func mover(delta):
	var targetPos = navegationAgent.get_next_path_position()
	var direction = global_position.direction_to(targetPos)
	
	velocity = direction * SPEED
	move_and_slide()
