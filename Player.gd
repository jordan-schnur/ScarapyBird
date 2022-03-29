extends KinematicBody

export var flap_impulse = 20 #m/s=
export var gravity = 75 #m/s^2

var velocity = Vector3.ZERO

var is_dead = false
var starting_position

func _ready():
	starting_position = translation


func initalize(start_position):
	translation = start_position

func _physics_process(delta):
	velocity.y -= gravity * delta
	
	if Input.is_action_just_pressed("flap") and !is_dead:
		velocity.y += flap_impulse
		
	move_and_slide(velocity)
	
	for index in range(get_slide_count()):
		var collision = get_slide_collision(index)
		
		if collision.collider.is_in_group("instant_kill"):
			print("instant kill")
			$Pivot/CPUParticles.emitting = true
			is_dead = true

			


func _on_VisibilityNotifier_screen_exited():
	is_dead = true


func _on_Area_body_entered(body):
	print("instant kill")
	$Pivot/CPUParticles.emitting = true
