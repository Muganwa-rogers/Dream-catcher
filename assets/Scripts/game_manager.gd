extends Node

signal area_started;

var starting_area = 1;
var current_area = 1;
var area_path = "res://assets/Scenes/Areas/";

var dream = 0;
var area_container : Node2D
var player : PlayerController;
var hud : HUD
var main_manu = main_menu

var is_ready = false;


func reInit():
	hud = get_tree().get_first_node_in_group("hud")
	area_container = get_tree().get_first_node_in_group("area_container");
	player = get_tree().get_first_node_in_group("player")
	
	load_area(starting_area);

func next_area():
	current_area += 1;
	load_area(current_area);

func restart_game():
	#current_area = starting_area
	dream = 0
	reset_dreams()

	# Remove any existing area children
	for child in area_container.get_children():
		child.queue_free()
	#current_area = starting_area;

	load_area(current_area)

	# Reset player position and any other state
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	if player_start_position:
		player.teleport_to_location(player_start_position.position)


func load_area(area_number):
	var full_path = area_path + "area_" + str(current_area) + ".tscn";
	var scene = load(full_path) as PackedScene;
	if !scene:
		return
		
#	remove the prev scene

	for child in area_container.get_children():
		child.queue_free();
		await child.tree_exited;
	
	##seting the new scene
	var instance = scene.instantiate()
	area_container.add_child(instance);
	reset_dreams()
	
#	moving the player to the start position of the new scene
	
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D;
	player.teleport_to_location(player_start_position.position)
	area_started.emit()
	
func add_dream():
	dream += 1;
	hud.update_dream_label(dream);
	if dream >= 24:
		var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit;
		portal.Open();
		print("hey you'v done it")
		hud.portal_opened();

func reset_dreams():
	dream = 0;
	hud.update_dream_label(dream)
	hud.portal_closed();
