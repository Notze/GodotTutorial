# StateMachine implementation of a tutorial that just shows and hides explanatory labels
class_name TutorialStateMachine extends Node

enum States {
	init,
	walk,
	jump,
	duck,
	done
}

@onready var context: TutorialStateContext = TutorialStateContext.new(  $label_duck,
																		$label_jump,
																		$label_walk,
																		$Area2DWalkFinished,
																		$Area2DJumpFinished,
																		$Area2DDuckStarted,
																		$Area2DDuckFinished)
@onready var state_handlers: Dictionary[States, ITutorialStateHandler] = {
	States.init: InitStateHandler.new(),
	States.walk: WalkStateHandler.new(context),
	States.jump: JumpStateHandler.new(context),
	States.duck: DuckStateHandler.new(context),
	States.done: DoneStateHandler.new(self),
}

func _process(_delta: float) -> void:
	var current_state_handler: ITutorialStateHandler = state_handlers.get(GameStates.current_tutorial_state)
	var new_state = current_state_handler.update()
	if new_state != GameStates.current_tutorial_state:
		var new_state_handler: ITutorialStateHandler = state_handlers.get(new_state)
		current_state_handler.leave()
		new_state_handler.enter()
		GameStates.current_tutorial_state = new_state

## Stops execution of the state machine by deleting it. Should be called in DONE state
func stop() -> void:
	if _isSafeToDelete():
		queue_free()
	
func _isSafeToDelete() -> bool:
	for label: Label in context.allLabels():
		if Fader.hasFader(label):
			return false
	return true
