class_name ClickState
extends Resource

signal clicked(amount:int)
signal clicks_updated(from:int, to:int)

var clicks :int = 0 : set = set_clicks

func click(amount:int=1):
	clicked.emit(amount)
	set_clicks(clicks + amount)

func set_clicks(to:int):
	var prev :int = clicks
	clicks = to
	clicks_updated.emit(prev, clicks)
