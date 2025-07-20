extends RichTextLabel

var base_size = Vector2(58, 63)
var size_update = -20
var health

func _label_size(text:String):
	self.text = text
	var new_size=base_size.x + (text.length() * size_update)
	custom_minimum_size = Vector2(new_size,base_size.y)

func _process(delta):
	health = ("Health: " + str(Globals.player_health))
	_label_size(health)
