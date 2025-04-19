extends Node

var scence_size	# 屏幕尺寸
var order_window_pos = [
	Vector2(1408, 1300),
	Vector2(1920, 1300),
	Vector2(2432, 1300),
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	获取屏幕尺寸
	scence_size	= get_viewport().get_visible_rect().size
#	开启初始延时计时器
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
#	注意！还在开发：退出游戏功能
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			print("esc")

# 初始延时结束，开启各个顾客生成计时器
func _on_start_timer_timeout():
	$OrderWindow1/ClientTimer1.start()
	$OrderWindow2/ClientTimer2.start()
	$OrderWindow3/ClientTimer3.start()

# 在一号窗口生成一个顾客实例
func _on_order_window_1_client_generate():
	$OrderWindow1.client_builder(order_window_pos[0])

# 在二号窗口生成一个顾客实例
func _on_order_window_2_client_generate():
	$OrderWindow2.client_builder(order_window_pos[1])

# 在三号窗口生成一个顾客实例
func _on_order_window_3_client_generate():
	$OrderWindow3.client_builder(order_window_pos[2])

# 一号窗口满客，停止在该窗口生成顾客实例
func _on_order_window_1_fullhouse():
	$OrderWindow1/ClientTimer1.stop()

# 二号窗口满客，停止在该窗口生成顾客实例
func _on_order_window_2_fullhouse():
	$OrderWindow2/ClientTimer2.stop()

# 三号窗口满客，停止在该窗口生成顾客实例
func _on_order_window_3_fullhouse():
	$OrderWindow3/ClientTimer3.stop()
