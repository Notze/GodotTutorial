class_name Slime extends HorizontallyMovingBody2D


@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft


func _init(speed: float = 50, direction: int = 1):
	m_speed = speed
	m_direction = direction

func _physics_process(delta: float) -> void:
	_updateDirection()
	super._physics_process(delta)

func _process(_delta: float) -> void:
	_updateSprite()
	
func _updateDirection() -> void:
	if m_direction < 0 and ray_cast_left.is_colliding():
		m_direction = 1
	elif m_direction > 0 and ray_cast_right.is_colliding():
		m_direction = -1

func _updateSprite() -> void:
	animated_sprite_2d.set_flip_h(true if m_direction < 0 else false)
