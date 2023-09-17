extends TextureButton

@export var click_state :ClickState
@export var upgrade_state :UpgradeState
var tween :Tween

func _ready():
	click_state.clicked.connect(click)
	pivot_offset = size / 2.0

func click(amount:int=1):
	if tween: tween.kill()
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(1.2, 0.8), 0.1)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), 0.2)

func _pressed():
	click_state.click(upgrade_state.clicks_amount)
