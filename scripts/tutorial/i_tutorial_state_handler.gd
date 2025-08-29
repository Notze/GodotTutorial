## Interface for a StateHandler called by the state machine
class_name ITutorialStateHandler

const State = TutorialStateMachine.States


## Called by the state machine once on entering this state.
func enter() -> void:
	pass
	
## Called by the state machine on every cycle. Handles behaviour and checks transitions.
##
## Returns the new State after execution.
func update() -> State:
	assert(false, "Must be overridden by child class!")
	return State.done

## Called by the state machine once on leaving this state.
func leave() -> void:
	pass
