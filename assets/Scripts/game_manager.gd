extends Node

var current_area = 1;
var area_path = "res://assets/Scenes/Areas/";

func next_level():
	current_area += 1;
	
	var full_path = area_path + "area_" + str(current_area) + ".tscn";
	get_tree().change_scene_to_file(full_path);
	
#	Just for show !!!!!!!!!

	print("The player has enterd Area" + str(current_area));
