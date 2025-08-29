class_name Player extends HorizontallyMovingBody2D


enum CollisionLayers {
	world = 1,
	platforms = 2,
	enemies = 3,
	player = 8
}

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var m_is_dead = false


var m_jump_velocity: float = PlayerProperties.base_jump_velocity

var m_double_jump_ready: bool = PlayerProperties.has_double_jump_ability

const max_m_jump_velocity: float = -400


func _init():
	m_speed = PlayerProperties.speed

func _physics_process(delta: float) -> void:
	if m_is_dead:
		move_and_slide()
		return
	_handleJump()
	_handleDuck()
	_updateDirection()
	super._physics_process(delta)

func _process(_delta: float) -> void:
	_updateSprite(_determineCurrentAnimation())

func _handleJump() -> void:
	if is_on_floor():
		_resetDoubleJump()
	if not _canJump():
		return
	if Input.is_action_just_released("jump"):
		velocity.y = max(max_m_jump_velocity, m_jump_velocity)
		_resetJumpVelocity()
		return
	if Input.is_action_pressed("jump") and PlayerProperties.has_power_jump_ability:
		m_jump_velocity += (max_m_jump_velocity-m_jump_velocity)/10

func _handleDuck() -> void:
	var fall_throught_platforms = not Input.is_action_pressed("down")
	set_collision_mask_value(CollisionLayers.platforms, fall_throught_platforms)

func _updateDirection() -> void:
	m_direction = int(Input.get_axis("left", "right"))

func _determineCurrentAnimation() -> String:
	if m_is_dead:
		return "death"
	if Input.is_action_pressed("down"):
		return "duck"
	if not is_on_floor():
		return "fall"
	if Input.is_action_pressed("up"):
		return "roll"
	if m_direction != 0:
		return "run"
	if Input.is_action_pressed("jump"):
		return "duck"
	return "idle"

func _updateSprite(animation: String) -> void:
	animated_sprite_2d.animation = animation
	if m_direction == 0:
		return
	animated_sprite_2d.set_flip_h(true if m_direction < 0 else false)


func _canJump() -> bool:
	return is_on_floor() or m_double_jump_ready

func _resetJumpVelocity() -> void:
	m_jump_velocity = PlayerProperties.base_jump_velocity

func _resetDoubleJump() -> void:
	m_double_jump_ready = PlayerProperties.has_double_jump_ability
