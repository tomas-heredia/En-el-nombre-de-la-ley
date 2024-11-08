extends CharacterBody3D

const SPEED = 5.0
var direction = Vector3(0,0,0)

@onready var animation_player = $model/AnimationPlayer
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(delta):
	pass
	#var xform: Transform3D = global_transform.looking_at(global_position - direction , Vector3.UP) 
#
	#$model.rotation = xform.basis.x.slerp($model.rotation , delta*20)
	#var fwd = $model.quaternion * Vector3.FORWARD 
	#fwd = fwd.slerp(direction, delta*20)
	#$model.transform = $model.global_transform.looking_at(global_position - fwd, Vector3.UP)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	if !DialogicHandeler.hablando && Global.moverse:
		# Handle jump.
		
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		
		
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			rotar(direction)
			animation_player.play("woman/run")
			
			
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			animation_player.play("woman/idle")
		
	else :
		velocity.x = 0
		velocity.z = 0
	
	move_and_slide()

func rotar(direction):
	pass
	var x = Vector2(direction.x,0)
	var z = Vector2(0,direction.z)
	var tween = create_tween()
	var dir = x.angle_to_point(z)-1.5708
	#$model.rotation.y = dir.slerp($model.rotation.y,20)
	$model.rotation.y = dir
	##move_toward($model.rotation.y,dir,0.1)
