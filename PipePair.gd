extends Node

var pipe_min = -3.716
var pipe_max = 1.645
var pipe_offset = 11.023 - pipe_max
var move_speed = 2 #m/2
var start_positon = 10
var hasBeenSeen = false
		
func _physics_process(delta):
	$Pipe.translate(Vector3(-move_speed * delta, 0, 0))
	# Flip translate because of -180 rotation
	$Pipe2.translate(Vector3(move_speed * delta, 0, 0))

func initialize(speed):
	move_speed = speed
	var random_y_pos = rand_range(pipe_min, pipe_max)
	$Pipe.translation = Vector3(10, random_y_pos, 0)
	
	$Pipe2.translation = Vector3(10, random_y_pos + pipe_offset, 0)


func _on_VisibilityNotifier_screen_entered():
	hasBeenSeen = true


func _on_VisibilityNotifier_screen_exited():
	if hasBeenSeen:
		queue_free()
