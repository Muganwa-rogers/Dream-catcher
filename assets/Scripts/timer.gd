extends Node

class_name timer;

var time = 0.0;
var stopped = false;

func _process(delta: float) -> void:
	if stopped:
		return
	
	time += delta
	
func reset_timer():
	time = 0.0;
func _ready():
	GameManager.area_started.connect(reset_timer)

func time_to_string() -> String:
	var msec = fmod(time, 1) * 1000;
	var sec = fmod(time, 60);
	var min = time / 60;
	var format_string = "%02d : %02d : %02d";
	var actual_string = format_string % [min, sec, msec];
	return actual_string
