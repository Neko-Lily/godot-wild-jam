extends Node

var burningTree = preload("res://enemies/burning-tree/scene/burningTree.tscn")


func _ready() -> void:
	burningTree.get_local_scene()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_burning_trees()

func spawn_burning_trees():
	while Globals.tree_count != 128:
		var burnTreeInstance = burningTree.instantiate()
		add_child(burnTreeInstance)
		Globals.tree_count += 1
		if burnTreeInstance.position == burnTreeInstance.position:
			burnTreeInstance.position = Vector2(randi_range(-928, 928),randi_range(-488, 508)) 
		else:
			add_child(burningTree)
			burnTreeInstance.position = Vector2(randi_range(-928, 928),randi_range(-488, 508))
