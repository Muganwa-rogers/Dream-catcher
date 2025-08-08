extends Control


func _ready():
	$VBoxContainer/Quit.pressed.connect(_on_quit_pressed)
	$VBoxContainer/Restart.pressed.connect(_on_restart_pressed)
	
func _on_restart_pressed():
	get_tree().change_scene_to_file("res://assets/Scenes/gameplay.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
