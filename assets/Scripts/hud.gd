extends Control

class_name HUD; 

@export var dream_label : Label;
@export var portal_label : Label;

func update_dream_label(number: int):
	dream_label.text = "Progress Points (PP)" + str(number)

func portal_opened():
	portal_label.text = "✨	Success unlocked. You made it happen!";
func portal_closed():
	portal_label.text = "🧠 Success isn’t yours yet, achieve more , it will be!"
