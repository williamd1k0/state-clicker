class_name UpgradeState
extends Resource

signal auto_clicker_toggled(enabled:bool)
signal clicks_amount_updated(clicks:int)

@export var auto_clicker_delay :float = 5.0
var auto_clicker :bool = false : set = set_auto_clicker
var clicks_amount :int = 1 : set = set_clicks_amount

func set_auto_clicker(enabled:bool):
	auto_clicker = enabled
	auto_clicker_toggled.emit(auto_clicker)

func set_clicks_amount(amount:int):
	clicks_amount = amount
	clicks_amount_updated.emit(clicks_amount)
