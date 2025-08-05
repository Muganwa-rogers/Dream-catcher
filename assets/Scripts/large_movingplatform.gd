extends Path2D
class_name Large_movingplatform;

@export var path_time = 1.0;
@export var Ease : Tween.EaseType;
@export var Transition : Tween.TransitionType;
@export var parthfollow2D : PathFollow2D;

func _ready():
	move_tween();
	
func move_tween():
	var tween = get_tree().create_tween().set_loops();
	tween.tween_property(parthfollow2D, "progress_ratio", 1.0, path_time).set_ease(Ease).set_trans(Transition);
	tween.tween_property(parthfollow2D, "progress_ratio", 0.0, path_time).set_ease(Ease).set_trans(Transition);
	
	
