extends Sprite2D



func _on_area_2d_area_entered(area):
	if area.is_in_group("kill"):
		self.queue_free()
	if area.is_in_group("pkill"):
		get_tree().reload_current_scene.bind().call_deferred()
