## Composition for gravity afflicted objects like the player, an enemy or a falling item.
## Parent node must be of type CharacterBody2D and contain speed (float) and direction (int)
class_name HorizontallyMovingBody2D extends CharacterBody2D


## The speed at which the character moves.
var m_speed: float = 0

## The direction in which the character moves.
## right is positive, left is negative, 0 is neutral (no movement)
## only the sign is taken into account for velocity calculations
var m_direction: int = 0


func _physics_process(_delta: float) -> void:
	_moveHorizontally()
	move_and_slide()
	
func _moveHorizontally() -> void:
	velocity.x = sign(m_direction) * m_speed
