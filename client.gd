extends Area2D
	
var _favorite_food # 喜欢的食物

# 取餐交互
func _on_favorite_food_entered(area: Area2D) -> void:
#	注意！还在开发：当前食物为顾客的指定食物时完成...操作
	if area.name == "Food":
		print(area.name, " 进入了当前区域")
		
	print("happy!")
