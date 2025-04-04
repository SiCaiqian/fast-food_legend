extends Node

var scence_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	获取屏幕尺寸
	scence_size	= get_viewport().get_visible_rect().size
	$StartTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
#	注意！还在开发：退出游戏功能
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			print("esc")


func _on_start_timer_timeout():
	$OrderWindow1/ClientTimer1.start()
	$OrderWindow2/ClientTimer2.start()
	$OrderWindow3/ClientTimer3.start()


func _on_order_window_1_fullhouse():
	$OrderWindow1/ClientTimer1.stop()


func _on_order_window_2_fullhouse():
	$OrderWindow2/ClientTimer2.stop()


func _on_order_window_3_fullhouse():
	$OrderWindow3/ClientTimer3.stop()


func _on_order_window_1_client_generate():
	$OrderWindow1.client_builder(Vector2(320, 400))


func _on_order_window_2_client_generate():
	$OrderWindow2.client_builder(Vector2(640, 400))


func _on_order_window_3_client_generate():
	$OrderWindow3.client_builder(Vector2(960, 400))
