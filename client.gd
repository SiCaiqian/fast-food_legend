extends Area2D
	
var order_position
@export var move_speed := 300.0
var favorite_food	# 喜欢的食物

func _ready() -> void:
	pass

# 初始化实例初始位置信息与目标位置信息
func initialize(start_pos: Vector2, end_pos: Vector2, spawn_left: bool):
	position = start_pos
	order_position = end_pos
	
#	根据实例生成方向播放对应朝向动画
	if spawn_left == true:
		$AnimatedSprite2D.play("walk_right")
	else:
		$AnimatedSprite2D.play("walk_left")

func _process(delta: float) -> void:
	if not order_position:
		print("未正确设置目标订餐窗口！")
		return
	
#	将实例移动至指定的订餐窗口
#	第一阶段：实例移动至窗口上方位置
	position = position.move_toward (Vector2(order_position.x, position.y), move_speed * delta)
#	第二阶段：实例从窗口上方位置向下移动至窗口
	if position.x == order_position.x:
		position = position.move_toward(order_position, move_speed * delta)
		var scale_val = 2 + 1 * delta
		$AnimatedSprite2D.scale = Vector2(scale_val, scale_val)
#	注意！还在开发：到达指定窗口后的具体行为
	if position == order_position:
		#queue_free()
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

	
