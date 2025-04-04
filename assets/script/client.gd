extends Area2D
	
var order_position	# 订餐位置
var spawn_left: bool	# 实例朝向
@export var move_speed := 200.0
var favorite_food	# 喜欢的食物

var client_tween

func _ready() -> void:
	client_tween = get_tree().create_tween()

# 初始化实例初始位置信息与目标位置信息
func initialize(start_pos: Vector2, end_pos: Vector2, spawn_left_p: bool):
#	初始化实例生成位置
	position = start_pos
#	初始化订餐位置
	order_position = end_pos
#	初始化实例方向
	spawn_left = spawn_left_p
	
#	根据实例方向播放对应行走动画
	if spawn_left:
		$AnimatedSprite2D.play("walk_right")
	else:
		$AnimatedSprite2D.play("walk_left")
	
	client_tween.tween_property(self, "position", Vector2(order_position.x, position.y), 3)
	client_tween.tween_callback(func():
		$AnimatedSprite2D.play("walk_front")
		)
	client_tween.tween_property(self, "position", order_position, 1)
	client_tween.tween_callback(func ():
		$AnimatedSprite2D.play("idle")
	)

func _process(delta: float) -> void:
	if not order_position:
		print("未正确设置目标订餐窗口！")
		return
##	注意！还在开发：到达指定窗口后的具体行为
	#if position == order_position:
		#pass

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

	
