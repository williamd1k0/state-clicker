extends Label

@onready var tmp :String = text

func _ready():
	var tween = create_tween()
	tween.tween_property(self, "position", position - Vector2(0, 100), 0.2)
	tween.parallel().tween_property(self, "modulate", Color.TRANSPARENT, 0.1).set_delay(0.1)
	tween.tween_callback(queue_free)

func set_amount(value:int):
	text = tmp % value
