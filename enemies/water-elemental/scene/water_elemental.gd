extends RigidBody2D
var speed = 100

func _ready() -> void:
	Globals.game_over.connect(_on_game_over)
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == get_tree().get_first_node_in_group("Player"):
		Globals.player_health -= 10


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_game_over():
	queue_free()
