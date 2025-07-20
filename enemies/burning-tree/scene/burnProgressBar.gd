extends ProgressBar

@onready var burnProgressTimer: Timer = $"../burnProgressTimer"
@onready var progressBackground: ProgressBar = $".."
var burnProgress: float = 0


func _on_burning_tree_body_entered(body: Node2D) -> void:
	progressBackground.visible = true
	burnProgressTimer.start(0.25)

func _on_burning_tree_body_exited(body: Node2D) -> void:
	burnProgressTimer.stop()


func _on_burn_progress_timer_timeout() -> void:
	burnProgress += 0.25
	value = burnProgress
