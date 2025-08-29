class_name DoneStateHandler extends ITutorialStateHandler


var m_state_machine: TutorialStateMachine


func _init(state_machine: TutorialStateMachine) -> void:
	m_state_machine = state_machine	

func update() -> State:
	m_state_machine.stop()
	return State.done
