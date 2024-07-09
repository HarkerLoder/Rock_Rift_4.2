extends Button


func _on_pressed():
	get_tree().change_scene_to_file("res://islands.tscn")


func _on_button_2_pressed():
	get_tree().quit()
