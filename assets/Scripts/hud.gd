extends Control
class_name HUD; 

@export var dream_label : Label;
@export var portal_label : Label;
@export var timer_label : Label;

var timer : timer

func _ready() -> void:
	timer = get_tree().get_first_node_in_group("timer");
	
func _process(delta: float) -> void:
	update_timer_label();

func update_timer_label():
	timer_label.text = timer.time_to_string();

func update_dream_label(number: int):
	var left = 24 - number
	var text_value = "PP %d , %d left to achieve!" % [number, left]
	dream_label.text = text_value

func portal_opened():
	portal_label.text = "✨	SUCCESS DOORS IS unlocked. You made it happen!";
	portal_label.add_theme_color_override("font_color", Color(1, 0.84, 0, 1))
	
func portal_closed():
	portal_label.text = "Achieve all (24) dreams🧠 to open The door of SUCCESS!"
