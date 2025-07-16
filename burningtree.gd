extends Area2D

@export var sprite: Sprite2D
@export var burnTimer: Timer
var timeLeft: float
var resizeTimer: Timer = Timer.new()
var fadeTimer: Timer = Timer.new()

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


func _on_burn_trigger_timer_timeout() -> void:
	start_resizeTimer()
	start_fadeTimer()

func start_fadeTimer():
	add_child(fadeTimer)
	fadeTimer.set_wait_time(3.0)
	fadeTimer.one_shot = true
	fadeTimer.timeout.connect(_on_fade_timer_timeout)
	fadeTimer.start()
	
func start_resizeTimer():
	sprite.modulate = Color.from_rgba8(207, 53, 46)
	self.add_child(resizeTimer)
	resizeTimer.set_wait_time(0.35)
	resizeTimer.one_shot = false
	resizeTimer.timeout.connect(_on_resize_timer_timeout)
	resizeTimer.start()

func _on_resize_timer_timeout():
	if scale < Vector2(0.3,0.3):
		set_scale(Vector2(0.35, 0.35))
		
	elif scale > Vector2(0.3, 0.3):
		set_scale(Vector2(0.25,0.25))
	
	else:
		set_scale(Vector2(0.4,0.4))

func _on_fade_timer_timeout():
	queue_free()
