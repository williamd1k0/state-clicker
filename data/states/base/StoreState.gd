class_name StoreState
extends Resource

signal values_updated

@export var sell_batch :int = 10
@export var sell_price :int = 100

func set_store_values(batch:int, price:int):
	sell_batch = batch
	sell_price = max(price, 1)
	values_updated.emit()
