extends Node


var burningTree = preload("res://enemies/burning-tree/scene/burningTree.tscn")
var waterElemental = preload("res://enemies/water-elemental/scene/waterElemental.tscn")
var spawn_range_x = 864
var spawn_range_y = 424
@onready var elementalSpawnTimer: Timer = $elementalSpawnTimer
var waterElementalCount: int = Globals.enemy_count
var timePassed: int
@onready var startScreen = get_node("startScreen")
@onready var levelScreen = get_node("level")
@onready var music = $Music
@onready var sfx = $SFX
var backgroundMusic = load("res://audio/loop-menu-preview-109594.mp3")
var menuMusic = load("res://audio/loop-menu-preview-109594.mp3")

func _ready() -> void:
	music.stream = menuMusic
	music.play()
	Globals.current_scene = Globals.Scene.START_SCREEN
	burningTree.get_local_scene()
	Globals.game_over.connect(_on_game_over)

# Called every frame. 'signal game_overdelta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	screen_changed()
	

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

func spawn_elementals():
	var waterElementalInstance = waterElemental.instantiate()
	
	var waterElementalSpawnLocation = $enemyPath/enemySpawnLocation
	waterElementalSpawnLocation.progress_ratio = randf()
	
	waterElementalInstance.position = waterElementalSpawnLocation.position
	
	var direction = waterElementalSpawnLocation.rotation + PI / 2
	
	direction += randf_range(-PI / 4, PI / 4)
	waterElementalInstance.rotation = direction
	
	var velocity = Vector2(randf_range(150, 250), 0)
	waterElementalInstance.linear_velocity = velocity.rotated(direction)
	
	add_child(waterElementalInstance)


		
func _on_elemental_spawn_timer_timeout():
	spawn_elementals()
	Globals.current_time += 1
	print(Globals.current_time)

func _on_play_button_pressed() -> void:
	sfx.play
	music.stop()
	music.stream = backgroundMusic
	music.play()
	startScreen.visible = false
	levelScreen.visible = true
	Globals.current_scene = Globals.Scene.LEVEL
	self.add_child(elementalSpawnTimer)
	elementalSpawnTimer.start(1)
	elementalSpawnTimer.set_paused(false)

func _on_quit_button_pressed() -> void:
	sfx.play
	get_tree().quit()

func screen_changed():
	if Globals.current_scene == Globals.Scene.START_SCREEN:
		levelScreen.visible = false
		startScreen.visible = true
	else:
		spawn_burning_trees()

func _on_game_over():
	elementalSpawnTimer.set_paused(true)
	Globals.tree_count = 0 
	Globals.current_time = 0
	Globals.current_scene = Globals.Scene.START_SCREEN
	Globals.score = 0
	Globals.player_health = 100
