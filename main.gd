extends Node

@export var client_scence: PackedScene
var scence_size


var order_window_x_dic = {
	"win0": 920,
	"win1": 656,
	"win2": 296
}
var order_window_y = 400

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

func _on_start_timer_timeout() -> void:
	$ClientTimer.start()
	
# 注意！还在开发：顾客生成器
# 根据 ClientTImer计时器 的 _timer_timeout信号 周期性生成 Client场景 实例
func _on_client_timer_timeout() -> void:
	var client = client_scence.instantiate()
	
	var spawn_left = randi() % 2
	
#	随即决定一个生成位置
	var spawn_pos = Vector2(
#		x轴上确保实例在屏幕外生成
		-50 if spawn_left else scence_size.x + 50,
#		y轴上随机高度生成
		randf_range(50, scence_size.y - 50)
	)
	
#	随机选定一个订餐窗口
	var order_pos = Vector2(
		order_window_x_dic["win" +  str(randi() % 3)],
		order_window_y
	)
	
	add_child(client)
	client.initialize(spawn_pos, order_pos)
