extends Node2D

#var player_died = false
#
#
#func _on_kill_zone_body_entered(body: Node2D) -> void:
	#player_died = true
	#get_tree().change_scene_to_file("res://assets/Scenes/UI/game_over.tscn");

var player_died = false;

func _on_kill_zone_body_entered(body: Node2D) -> void:
	player_died = true;
	#var game_over_screen = load("res://assets/Scenes/UI/game_over.tscn").instantiate()
	#add_child(game_over_screen)
	if body.is_in_group("player"):
		GameManager.restart_game()
