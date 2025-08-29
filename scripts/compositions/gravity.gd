## Composition for gravity afflicted objects like the player, an enemy or a falling item.
extends Node


func _physics_process(delta: float) -> void:
	_handleGravity(delta)
	
func _handleGravity(delta: float) -> void:
	if not get_parent().is_on_floor():
		get_parent().velocity += get_parent().get_gravity() * delta
