extends Node

var tree_count:int = 0
var player_health:int = 100
var score: int = 0
var current_scene = Scene.START_SCREEN

enum Scene {
	START_SCREEN,
	LEVEL
}
