@icon("res://assets/imgs/作业工具/菜板1.png")
extends "res://assets/script/tool.gd"

func _on_mouse_entered():
	$AnimatedSprite2D.play("working")
	self.scale = Vector2.ONE * 1.2

func _on_mouse_exited():
	$AnimatedSprite2D.play("idle")
	self.scale = Vector2.ONE
