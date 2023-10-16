extends Label

@export var shop_state :ShopState
@onready var tmp :String = text

func _ready():
	shop_state.values_updated.connect(update_shop_values)
	update_shop_values()

func update_shop_values():
	text = tmp % [shop_state.sell_batch, shop_state.sell_price / 100.0]
