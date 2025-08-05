extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.next_level();
