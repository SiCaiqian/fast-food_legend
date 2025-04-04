extends Node2D
signal fullhouse	# 满客状态信号

@export var client_scence: PackedScene	# 顾客场景类
var scence_size	# 屏幕尺寸
var window_pos	# 该窗口在主场景中的位置
var client_num:= 0	# 该窗口当前排队人数

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	获取屏幕尺寸
	scence_size	= get_viewport().get_visible_rect().size
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass

func client_add():
	client_num += 1
	
func client_lower():
	client_num -= 1
	
func on_fullhouse():
	fullhouse.emit()

# 注意！还在开发：顾客生成器
# 描述：
# 根据 ClientTImer计时器 的 _on_timer_timeout信号 周期性生成 Client场景实例；
# 生成完毕检查当前 client_num 的值，如果 client_num 的值大于最大排队人数则发出 fullhouse信号。
func client_builder(oeder_window_pos: Vector2):
	var client = client_scence.instantiate()
	
#	随机决定在 左（1）/右（0） 生成顾客实例
	var spawn_left = randi() % 2
	
#	随机决定一个生成位置
	var spawn_pos = Vector2(
#		x轴上确保实例在屏幕外生成
		-50 if spawn_left else scence_size.x + 50,
#		y轴上随机高度生成
		randf_range(50, 300)
	)
	
#	将实例加入场景树
	add_child(client)
#	更新排队人数
	client_add()
#	触发顾客实例动画
	client.initialize(spawn_pos, oeder_window_pos, spawn_left)
#	检查排队人数是否达到最大值
	if client_num >= 1:
		on_fullhouse()
