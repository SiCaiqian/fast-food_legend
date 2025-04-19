extends "res://assets/script/tool.gd"

@export var materials: PackedScene	# 该厨具供给的材料纹理

func _init():
	pass
	
# 根据 _input_event信号 生成 materials实例
func working(_viewport ,event, _shape_idx):
	# 检测鼠标点击事件
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# 鼠标在物体上按下时在鼠标位置生成一个 materials实例，get_rect() 作用是获取 Sprite节点 的边界
			if $Sprite2D.get_rect().has_point(to_local(event.position)):
				var materials_p = materials.instantiate()
				materials_p.position = get_local_mouse_position()
				
				get_viewport().set_input_as_handled()	# 防止事件进一步传播
				
				add_child(materials_p)
