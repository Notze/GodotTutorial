## Composition class for collectible items containing the main logic.
extends Node


enum actions {
	nothing,
	activate_power_jump, 
	deactivate_power_jump, 
	activate_double_jump, 
	deactivate_double_jump,
	}

@export var action: actions


## Called on being touched by the player. Manipulates player values if applicable, 
## then removes the item
func collect(_player: Player) -> void:
	print("Collect called with m_action: " + actions.keys()[action])
	match action:
		actions.nothing:
			pass
		actions.activate_power_jump:
			PlayerProperties.has_power_jump_ability = true
		actions.deactivate_power_jump:
			PlayerProperties.has_power_jump_ability = false
		actions.activate_double_jump:
			PlayerProperties.has_double_jump_ability = true
		actions.deactivate_double_jump:
			PlayerProperties.has_double_jump_ability = false
	get_parent().queue_free()
