extends Node

@export var client_scence: PackedScene
var scence_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	获取屏幕尺寸
	scence_size	= get_viewport().get_visible_rect().size
	
##	设置订餐窗口坐标
	#$OrderWindow1.position = Vector2(320, 400)
	#$OrderWindow2.position = Vector2(640, 400)
	#$OrderWindow3.position = Vector2(960, 400)
		#
	$StartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
#	注意！还在开发：退出游戏功能
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			print("esc")

func _on_start_timer_timeout() -> void:
	$OrderWindow1/ClientTimer1.start()
	$OrderWindow2/ClientTimer2.start()
	$OrderWindow3/ClientTimer3.start()

# 当 1号窗口 满客时停止在该窗口生成顾客
func _on_order_window_1_fullhouse() -> void:
	$OrderWindow1/ClientTimer1.stop()

# 当 2号窗口 满客时停止在该窗口生成顾客
func _on_order_window_2_fullhouse() -> void:
	$OrderWindow2/ClientTimer2.stop()
	
# 当 3号窗口 满客时停止在该窗口生成顾客
func _on_order_window_3_fullhouse() -> void:
	$OrderWindow3/ClientTimer3.stop()


func _on_client_timer_1_timeout() -> void:
	$OrderWindow1.client_generator(Vector2(320, 400))


func _on_client_timer_2_timeout() -> void:
	$OrderWindow2.client_generator(Vector2(640, 400))


func _on_client_timer_3_timeout() -> void:
	$OrderWindow3.client_generator(Vector2(960, 400))
