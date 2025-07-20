extends Node
signal game_over

var tree_count:int = 0
var enemy_count:int = 0
var player_health:int = 100
var score: int = 0
var current_scene = Scene.START_SCREEN
var current_time: int

func _process(delta: float) -> void:
	if player_health == 0:
		game_over.emit()

enum Scene {
	START_SCREEN,
	LEVEL,
}

enum Spawn {
	TOP,
	BOTTOM,
	LEFT,
	RIGHT,
}
