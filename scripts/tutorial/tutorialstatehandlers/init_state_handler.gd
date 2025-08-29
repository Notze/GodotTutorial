class_name InitStateHandler extends ITutorialStateHandler

func update() -> State:
	print("setting TutorialState to WALK")
	return State.walk
