extends Label

@export var click_state :ClickState
@onready var tmp :String = text
var tween :Tween

func _ready():
	click_state.clicks_updated.connect(update_counter)
	set_counter(click_state.clicks)
	pivot_offset = size / 2.0

func set_counter(value:int):
	text = tmp % value

func update_counter(from:int, to:int):
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_method(set_counter, from, to, 0.2)
	tween.parallel().tween_property(self, "scale", Vector2(1.2, 0.8), 0.1)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
