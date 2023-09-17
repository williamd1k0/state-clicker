extends Control

@export var click_state :ClickState
@export var cash_state :CashState
@export var store_state :StoreState
@export var upgrade_state :UpgradeState
@export var balancing :Balancing
var tween :Tween

func _ready():
	click_state.clicks_updated.connect(_on_clicks_updated)
	upgrade_state.auto_clicker_toggled.connect(_on_auto_clicker_toggled)

func _on_clicks_updated(from:int, to:int):
	var batch :int = 0
	while to >= store_state.sell_batch:
		batch += 1
		to -= store_state.sell_batch
	if batch > 0:
		cash_state.cash += batch * store_state.sell_batch * store_state.sell_price
		click_state.clicks -= batch * store_state.sell_batch
		store_state.set_store_values(
			store_state.sell_batch * balancing.sell_batch_mod,
			store_state.sell_price * balancing.sell_price_mod
		)

func _on_auto_clicker_toggled(enabled:bool):
	if enabled:
		if not tween:
			tween = create_tween()
			tween.tween_callback(auto_click).set_delay(upgrade_state.auto_clicker_delay)
	else:
		if tween: tween.kill()

func auto_click():
	click_state.click(upgrade_state.clicks_amount)
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_callback(auto_click).set_delay(upgrade_state.auto_clicker_delay)
