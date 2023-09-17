extends Button

@export var upgrade_state :UpgradeState
@export var cash_state :CashState
@export var balancing :Balancing
@onready var tmp :String = text

func _ready():
	cash_state.cash_updated.connect(update_buy_lock)
	update_buy_lock(0, cash_state.cash)
	text = tmp % (balancing.click_upgrade_price / 100.0)

func update_buy_lock(_from:int, cash:int):
	disabled = cash < balancing.click_upgrade_price

func _pressed():
	cash_state.cash -= balancing.click_upgrade_price
	upgrade_state.clicks_amount += 1
