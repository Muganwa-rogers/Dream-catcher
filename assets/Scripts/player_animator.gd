extends Node2D

@export var player_controller : PlayerController;
@export var animation_Player : AnimationPlayer;
@export var  sprite : Sprite2D;

func _process(delta):
	#Fliping the character 
	
	if player_controller.direction == 1:
		sprite.flip_h = false;
	elif  player_controller.direction == -1:
		sprite.flip_h = true;
#	Movement animation

	if abs(player_controller.velocity.x) > 0.0:
		animation_Player.play("move");
	else:
		animation_Player.play("ideal");
#	jump animation

	if player_controller.velocity.y < 0.0:
		animation_Player.play("jump");
	elif player_controller.velocity.y > 0.0:
		animation_Player.play("fall");
