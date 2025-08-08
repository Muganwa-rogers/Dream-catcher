extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0;
@export var jump_power = 10.0;


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

var speed_multiplier = 30.0;
var jumpp_multiplier = -30.0;
var direction = 0;

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event):	
	# Handle jump.
	
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jumpp_multiplier
	
	if event.is_action_pressed("move_down"):
		set_collision_mask_value(10, false);
	else:
		set_collision_mask_value(10, true);		
		
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier;
	else:
		velocity.x = move_toward(velocity.x, 0,speed * speed_multiplier)
	move_and_slide()
	
func teleport_to_location(new_location):
	position = new_location
