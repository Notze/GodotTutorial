## autoloaded class for fading labels
extends Node


## Internal list of unfinished LabelFaders
var m_faders: Dictionary[Label, LabelFader]


func _process(_delta: float) -> void:
	for fader: LabelFader in m_faders.values():
		var fader_finished = fader.update()
		if fader_finished:
			m_faders.erase(fader.m_label)

## Fade in the given Label. Overrides preexisting Fader for this Label if any.
func fadeIn(label: Label):
	m_faders.set(label, LabelFader.new(label, true))

## Fade out the given Label. Overrides preexisting Fader for this Label if any.
func fadeOut(label: Label):
	m_faders.set(label, LabelFader.new(label, false))

## Returns true if there is an active fader for the given label
func hasFader(label: Label) -> bool:
	return m_faders.has(label)
