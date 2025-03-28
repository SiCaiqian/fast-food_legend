extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
#	注意！还在开发：退出游戏功能
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			print("esc")
	


func _on_client_timer_timeout() -> void:
	pass # Replace with function body.
