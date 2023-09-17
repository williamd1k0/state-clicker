extends Label

@export var cash_state :CashState
@onready var tmp :String = text
var tween :Tween

func _ready():
	cash_state.cash_updated.connect(update_cash)
	set_cash(cash_state.cash)
	pivot_offset = size / 2.0

func set_cash(value:int):
	text = tmp % (value / 100.0)

func update_cash(from:int, to:int):
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_method(set_cash, from, to, 0.2)
	tween.parallel().tween_property(self, "scale", Vector2(1.2, 0.8), 0.1)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.1)
