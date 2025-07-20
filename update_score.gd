extends RichTextLabel

var base_size = Vector2(58, 63)
var size_update = 20
var score

func _label_size(text:String):
	self.text = text
	var new_size=base_size.x + (text.length() * size_update)
	custom_minimum_size = Vector2(new_size,base_size.y)

func _process(delta):
	score = ("Score: " + str(Globals.score))
	_label_size(score)
