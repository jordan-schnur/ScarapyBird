extends Node

export (PackedScene) var pipe_pair

export var camera_speed = 2 #m/2

func _ready():
	randomize()

func _process(delta):
	var current_pos = $Camera.translation
	
	var offset = Vector3(1, 0, 0) * camera_speed * delta
	
	#$Camera.translation = current_pos + offset
	
	if Input.is_action_pressed("close_game"):
		get_tree().quit()


func _on_Timer_timeout():
	var pipePair = pipe_pair.instance()
	
	pipePair.initialize(camera_speed)
	add_child(pipePair)
