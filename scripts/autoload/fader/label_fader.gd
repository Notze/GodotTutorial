## Class to fade in or fade out a given Label
class_name LabelFader


## The m_label to fade.
var m_label: Label

## The operation mode. If true the m_label will be faded in. If false the m_label will be faded out.
var m_fade_in: bool


func _init(label: Label, fade_in: bool = false) -> void:
	m_label = label
	m_fade_in = fade_in

## Fades the m_label. Also handles visibility flag.
##
## Returns true if fading is finished, otherwise false
func update() -> bool:
	if m_fade_in:
		return _fadeIn()
	else:
		return _fadeOut()

func _fadeIn():
	if m_label.visible:
		var alpha_value_of_m_label: float = m_label.modulate.a
		if alpha_value_of_m_label<1:
			m_label.modulate.a = alpha_value_of_m_label + .01
		else:
			return true
	else:
		m_label.modulate.a = .0
		m_label.visible = true
	return false

func _fadeOut():
	if m_label.visible:
		var alpha_value_of_m_label: float = m_label.modulate.a
		if alpha_value_of_m_label>0:
			m_label.modulate.a = alpha_value_of_m_label - .01
		else:
			m_label.visible = false
			return true
	return false
