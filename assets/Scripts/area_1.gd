extends Node2D

var player_died = false


func _on_kill_zone_body_entered(body: Node2D) -> void:
	player_died = true
	#get_tree().change_scene_to_file("res://assets/Scenes/UI/game_over.tscn");
	if body.is_in_group("player"):
		GameManager.restart_game()
