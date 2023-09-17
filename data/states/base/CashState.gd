class_name CashState
extends Resource

signal cash_updated(from:int, to:int)

var cash :int = 0 : set = set_cash

func set_cash(value:int):
	var prev :int = cash
	cash = value
	cash_updated.emit(prev, cash)
