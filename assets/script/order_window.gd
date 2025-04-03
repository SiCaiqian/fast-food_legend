extends Node
signal fullhouse

# 该窗口排队人数
var client_num := 0

@export var client_scence: PackedScene
var scence_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scence_size = get_viewport().get_visible_rect().size
	#pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if client_num >= 1:
		on_fullhouse()

# 根据 ClientTimer计时器 的 timeout()信号，更新排队人数
func client_add():
	client_num += 1
	
func client_lower():
	client_num -= 1

# 当 client_num 的值不等于 0 时视为满客，向主脚本发送信号：已满客，停止在该窗口生成顾客
func on_fullhouse():
	fullhouse.emit()

# 注意！还在开发：顾客生成器
# 描述：
# 检查三个订餐窗口的排队人数，当有任一窗口排队人数为0时，
# 根据 ClientTImer计时器 的 _timer_timeout信号 周期性生成 Client场景 实例，
# 随机分配至排队人数为0的窗口。
func client_generator(position: Vector2):
#	创建一个顾客实例
	var client = client_scence.instantiate()
	
#	随机决定实例在 左（0）/右（1） 边出现
	var spawn_left = randi() % 2 == 0
	
#	随机决定一个生成位置
	var spawn_pos = Vector2(
#		x轴上确保实例在屏幕外生成
		- 50 if spawn_left else scence_size.x + 50,
#		y轴上随机高度生成
		randf_range(150, 170)
	)
	
#	将实例加入节点
	add_child(client)
#	更新窗口的排队人数
	client_add()
#	调用 client脚本 的 initialize函数 使顾客实例运动至订餐点
	client.initialize(spawn_pos, position, spawn_left)
