class_name JumpStateHandler extends ITutorialStateHandler

var m_context: TutorialStateContext
var m_player_jumped = false

func _init(context: TutorialStateContext) -> void:
	m_context = context
	m_context.m_area_jump.body_entered.connect(playerJumped)
	
func update() -> State:
	if m_player_jumped:
		print("setting TutorialState to DUCK")
		return State.duck
	return State.jump

func playerJumped(_player: Player):
	m_player_jumped = true

func enter() -> void:
	Fader.fadeIn(m_context.m_label_jump)

func leave() -> void:
	Fader.fadeOut(m_context.m_label_jump)
