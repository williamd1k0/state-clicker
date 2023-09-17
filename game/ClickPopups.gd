extends Control

@export var click_popup :PackedScene
@export var click_state :ClickState

func _ready():
	click_state.clicked.connect(instance_popup)

func instance_popup(amount:int):
	var instance = click_popup.instantiate()
	add_child(instance)
	instance.set_amount(amount)
