extends Area2D
	
var order_position
@export var move_speed := 100.0
var favorite_food	# 喜欢的食物
var status_index	# 动画状态索引
var status_array	# 动画状态列表

func _ready() -> void:
##	获取动画列表
	#status_array = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	#
	#if status_array == null:
		#print("顾客动画状态异常")
	#
	
	#status_index = status_array[-1]
	#print(status_index)
	pass

# 初始化实例初始位置信息与目标位置信息
func initialize(start_pos: Vector2, end_pos: Vector2):
	position = start_pos
	order_position = end_pos
	$AnimatedSprite2D.play("walk")

func _process(delta: float) -> void:
	if not order_position:
		print("未正确设置目标订餐窗口！")
		return
	
#	将实例移动至指定的订餐窗口
	position = position.move_toward(order_position, move_speed * delta)
#	注意！还在开发：到达指定窗口后的具体行为
	if position == order_position:
		pass

func _physics_process(delta: float) -> void:
	pass
	
# 注意！还在开发：取餐交互
func _on_favorite_food_entered(area: Area2D) -> void:
#	注意！还在开发：当前食物为顾客的指定食物时完成...操作
	if area.name == "Food":
		print(area.name, " 进入了当前区域")
		print("happy!")
	else:
		print("anger!")

	
