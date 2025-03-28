extends Area2D

var _is_dragging # 鼠标拖拽信号
var drag_offset = Vector2.ZERO # 鼠标拖拽中心偏移量，防止物体中心瞬移到鼠标中心的问题

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	## 调试信号是否连接成功
	#print("信号连接状态: ", input_event.is_connected(_on_input_event))
	pass
	
func _physics_process(delta: float) -> void:
	if _is_dragging:
		_drag()

# 根据 _input_event信号 提供鼠标拖拽交互信号
func _on_input_event(viewport ,event, shape_idx):
	
#	检测鼠标点击事件
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed: 
			# 只有在物体上点击时才允许进行拖拽，get_rect() 作用是获取 Sprite 节点的边界
			if $Sprite2D.get_rect().has_point(to_local(event.position)):
				_is_dragging = true
				# 计算鼠标位置与对象中心的偏移量
				drag_offset = position - get_global_mouse_position()
				print("dragging", name)
				get_viewport().set_input_as_handled()	# 防止事件进一步传播
		# 鼠标释放
		else:
			if _is_dragging:
				print("not dragging", name)
				_is_dragging = false
# 拖拽交互功能
func _drag():
	# 如果正在拖拽，则更新物体位置
		position = get_global_mouse_position() + drag_offset

# 待优化： 添加鼠标悬停视觉效果_悬停
func _on_mouse_entered() -> void:
	pass # Replace with function body.

# 待优化： 添加鼠标悬停视觉效果_离开
func _on_mouse_exited() -> void:
	pass # Replace with function body.
