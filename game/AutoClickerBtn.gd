extends Button

@export var upgrade_state :UpgradeState
@export var cash_state :CashState
@export var balancing :Balancing
@onready var tmp :String = text

func _ready():
	cash_state.cash_updated.connect(update_buy_lock)
	upgrade_state.auto_clicker_toggled.connect(update_buy_check)
	update_buy_check(upgrade_state.auto_clicker)
	update_buy_lock(0, cash_state.cash)
	text = tmp % (balancing.auto_clicker_price / 100.0)

func update_buy_check(enabled:bool):
	visible = not enabled

func update_buy_lock(_from:int, cash:int):
	if upgrade_state.auto_clicker: return
	disabled = cash < balancing.auto_clicker_price

func _pressed():
	cash_state.cash -= balancing.auto_clicker_price
	upgrade_state.auto_clicker = true
