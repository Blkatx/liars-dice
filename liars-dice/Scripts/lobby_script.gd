extends Control

const Table:PackedScene = preload("res://Table.tscn")

func _on_host_pressed() -> void:
	disable_buttons()
	MultiplayerManager.create_server()
	get_tree().change_scene_to_packed(Table)

func _on_join_pressed() -> void:
	disable_buttons()
	MultiplayerManager.connect_to_server()
	get_tree().change_scene_to_packed(Table)


func disable_buttons()->void:
	$VBoxContainer/Host.disabled = true
	$VBoxContainer/Join.disabled = true
	$VBoxContainer.visible = false
