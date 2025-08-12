extends Control


func _ready():
	$VBoxContainer/Quit.pressed.connect(_on_quit_pressed)
	$VBoxContainer/Restart.pressed.connect(_on_restart_pressed)
	

func _on_restart_pressed():
	GameManager.restart_game()
	##get_tree().paused = false
	##$GameplayCamera.current = false
	#get_tree().reload_current_scene();
	##var game_over_screen = load("res://assets/Scripts/area_1.gd").instantiate()
	##add_child(game_over_screen)
	#
func _on_quit_pressed():
	get_tree().quit()
