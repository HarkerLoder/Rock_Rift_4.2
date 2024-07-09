extends Sprite2D

func _on_area_2d_area_entered(area):
	if area.is_in_group("plr"):
		self.queue_free()
		GlobalVars.Coins += 1
		print("coin")
