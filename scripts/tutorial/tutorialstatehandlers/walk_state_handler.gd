class_name WalkStateHandler extends ITutorialStateHandler


var m_context: TutorialStateContext

var m_player_moved := false


func _init(context: TutorialStateContext) -> void:
	m_context = context
	m_context.m_area_walk.body_exited.connect(playerMoved)

func enter() -> void:
	Fader.fadeIn(m_context.m_label_walk)
	
func update() -> State:
	if m_player_moved:
		print("setting TutorialState to JUMP")
		return State.jump
	return State.walk

func leave() -> void:
	Fader.fadeOut(m_context.m_label_walk)


func playerMoved(_player: Player) -> void:
	m_player_moved = true
