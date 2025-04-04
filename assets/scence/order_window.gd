extends Node2D
signal fullhouse # 满客状态信号

@export var client_scence: PackedScene
var scence_size
var window_pos
var client_num:= 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
# 根据 ClientTImer计时器 的 _timer_timeout信号 周期性生成 Client场景 实例
func client_builder(oeder_window_pos: Vector2):
	var client = client_scence.instantiate()
	
#	随机决定在 左（1）/右（0） 生成顾客实例
	var spawn_left = randi() % 2
	
#	随即决定一个生成位置
	var spawn_pos = Vector2(
#		x轴上确保实例在屏幕外生成
		-50 if spawn_left else scence_size.x + 50,
#		y轴上随机高度生成
		randf_range(120, 180)
	)
	
	
	add_child(client)
	client_add()
	client.initialize(spawn_pos, oeder_window_pos, spawn_left)
	
	if client_num >= 1:
		on_fullhouse()
