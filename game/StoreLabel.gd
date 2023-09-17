extends Label

@export var store_state :StoreState
@onready var tmp :String = text

func _ready():
	store_state.values_updated.connect(update_store_values)
	update_store_values()

func update_store_values():
	text = tmp % [store_state.sell_batch, store_state.sell_price / 100.0]
