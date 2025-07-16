extends Area2D

@export var burnTimer: Timer
var timeLeft: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	
	if burnTimer.wait_time > 0:

		if burnTimer.is_paused():
			burnTimer.set_paused(false) 
		else:
			burnTimer.start()
			print(burnTimer.get_time_left())
func _on_body_exited(body: Node2D) -> void:
	if burnTimer.wait_time > 0:
		set_wait_time_to_time_left()
		burnTimer.stop()


func _on_timer_timeout() -> void:
	monitoring = false
	burnTimer.queue_free()

func set_wait_time_to_time_left() -> void:
	timeLeft = burnTimer.get_time_left()
	burnTimer.set_wait_time(timeLeft)
