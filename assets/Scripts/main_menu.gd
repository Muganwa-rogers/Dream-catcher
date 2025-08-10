extends Control

class_name main_menu;

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/Scenes/gameplay.tscn");
	#GameManager.is_ready = true;

func _on_quit_pressed() -> void:
	get_tree().quit();
