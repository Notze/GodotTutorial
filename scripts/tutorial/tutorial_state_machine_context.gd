## Simple data holder for shared data between tutorial state handlers.
class_name TutorialStateContext


var m_label_duck: Label
var m_label_jump: Label
var m_label_walk: Label
var m_area_walk: Area2D
var m_area_jump: Area2D
var m_area_duck_started: Area2D
var m_area_duck_finished: Area2D


func _init( label_duck: Label,
			label_jump: Label,
			label_walk: Label,
			area_walk: Area2D,
			area_jump: Area2D,
			area_duck_started: Area2D,
			area_duck_finished: Area2D) -> void:
	m_label_duck = label_duck
	m_label_jump = label_jump
	m_label_walk = label_walk
	m_area_walk = area_walk
	m_area_jump = area_jump
	m_area_duck_started = area_duck_started
	m_area_duck_finished = area_duck_finished

func allLabels() -> Array[Label]:
	return [m_label_duck, m_label_jump, m_label_walk]
