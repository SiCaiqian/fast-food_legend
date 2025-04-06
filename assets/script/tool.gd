#class_name MyToolClass
extends Area2D

# 工具类型
enum ToolTypeOption { 
	PROVIDE = 0, # 供给类
	COOKING = 1, # 烹饪类
	COMBINE = 2  # 组合类 
}

@export var tool_type: ToolTypeOption = ToolTypeOption.PROVIDE

# 鼠标悬停视觉效果_悬停
func _on_mouse_entered() -> void:
	self.scale = Vector2.ONE * 1.2

# 鼠标悬停视觉效果_离开
func _on_mouse_exited() -> void:
	self.scale = Vector2.ONE

func tool_working():
	if tool_type == null:
		print("未设置工具类型！")
		return
