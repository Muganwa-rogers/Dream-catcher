extends Area2D
class_name AreaExit;

@export var sprite :Sprite2D

var is_open = false;

func _ready():
	if not sprite:
		sprite = $Sprite2D
	Close();

func Open():
	is_open = true;
	if sprite :
		sprite.region_rect.position.x = 22;

func Close():
	is_open = false;
	if sprite:
		sprite.region_rect.position.x = 0

func _on_body_entered(body: Node2D):
	if is_open == true && body is PlayerController:
		GameManager.next_area();
