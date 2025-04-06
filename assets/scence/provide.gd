extends "res://assets/script/tool.gd"

@export var materials: Texture

#func _process(delta: float):
	#
#
#func working():
	##	检测鼠标点击事件
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#if event.pressed:
			#
			## 只有鼠标在物体上按下时才允许进行拖拽，get_rect() 作用是获取 Sprite节点 的边界
			#if $Sprite2D.get_rect().has_point(to_local(event.position)):
				#_is_dragging = true
