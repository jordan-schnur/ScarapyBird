extends Node

export (PackedScene) var pipe_scene

export var camera_speed = 2 #m/2
var pipe_min = -3.716
var pipe_max = 1.645
var pipe_offset = 11.023 - pipe_max
export var gap = 1

func _ready():
	randomize()

func _process(delta):
	var current_pos = $Camera.translation
	
	var offset = Vector3(1, 0, 0) * camera_speed * delta
	
	$Camera.translation = current_pos + offset


func _on_Timer_timeout():
	var pipe = pipe_scene.instance()
	
	var random_y_pos = rand_range(pipe_min, pipe_max)
	pipe.translation = Vector3($Camera.translation.x + 3, random_y_pos, 0)
	
	add_child(pipe)
	
	var pipe2 = pipe_scene.instance()
	
	pipe2.set_rotation_degrees(Vector3(0, 0, -180))
	pipe2.translation = Vector3($Camera.translation.x + 3, random_y_pos + pipe_offset, 0)
	
	add_child(pipe2)
