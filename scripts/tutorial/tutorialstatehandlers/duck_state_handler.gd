class_name DuckStateHandler extends ITutorialStateHandler

var m_context: TutorialStateContext
var m_player_entered_zone = false
var m_player_ducked = false

func _init(context: TutorialStateContext) -> void:
	m_context = context
	m_context.m_area_duck_started.body_entered.connect(playerEnteredZone)
	m_context.m_area_duck_finished.body_entered.connect(playerDucked)
	
func update() -> State:
	if m_player_ducked:
		print("setting TutorialState to DONE")
		return State.done
	return State.duck

func leave() -> void:
	Fader.fadeOut(m_context.m_label_duck)
	
func playerEnteredZone(_player: Player):
	if not m_player_entered_zone:
		Fader.fadeIn(m_context.m_label_duck)
		m_player_entered_zone = true
	
func playerDucked(_player: Player):
	m_player_ducked = true
