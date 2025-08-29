## Composition for restarting the game after the player has died.
extends Area2D


@onready var restart_timer: Timer = $RestartTimer


func PlayerTouched(player: Player) -> void:
	print("Killzone touched")
	player.m_is_dead = true
	restart_timer.start()
	
func RestartGame() -> void:
	if not is_inside_tree():
		return
	get_tree().reload_current_scene()
