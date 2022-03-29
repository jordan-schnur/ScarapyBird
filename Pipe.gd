extends StaticBody



func _on_VisibilityNotifier_screen_exited():
	queue_free()
