extends Node

var burningTree = preload("res://enemies/burning-tree/scene/burningTree.tscn")
var spawn_range_x = 864
var spawn_range_y = 424
@onready var startScreen = get_node("startScreen")
@onready var levelScreen = get_node("level")

func _ready() -> void:
	Globals.current_scene = Globals.Scene.START_SCREEN
	burningTree.get_local_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_burning_trees()

func spawn_burning_trees():
	if Globals.current_scene == Globals.Scene.LEVEL:
		while Globals.tree_count != 128:
			var burnTreeInstance = burningTree.instantiate()
			add_child(burnTreeInstance)
			Globals.tree_count += 1
			if burnTreeInstance.position == burnTreeInstance.position:
				burnTreeInstance.position = Vector2(randi_range(-spawn_range_x, spawn_range_x),randi_range(-spawn_range_y, spawn_range_y)) 
			else:
				add_child(burningTree)
				burnTreeInstance.position = Vector2(randi_range(-spawn_range_x, spawn_range_x),randi_range(-spawn_range_y, spawn_range_y))

func _on_play_button_pressed() -> void:
	startScreen.visible = false
	levelScreen.visible = true
	Globals.current_scene = Globals.Scene.LEVEL # Replace with function body.

func _on_quit_button_pressed() -> void:
	get_tree().quit()
