extends Area2D

# 工具类型
enum ToolTypeOption { 
	PROVIDE = 0, # 供给类
	COOKING = 1, # 烹饪类
	COMBINE = 2  # 组合类 
}


# 鼠标悬停视觉效果_悬停
func _on_mouse_entered() -> void:
	self.scale = Vector2.ONE * 1.2

# 鼠标悬停视觉效果_离开
func _on_mouse_exited() -> void:
	self.scale = Vector2.ONE

func working():
	push_error("抽象方法work()未在子类中实现！")
	get_tree().quit()	# 开发时强制报错退出
