extends Control

var player_name:String = ""
const Table:PackedScene = preload("res://Table.tscn")

func _on_host_pressed() -> void:
	disable_buttons()
	MultiplayerManager.create_server(player_name)
	get_tree().change_scene_to_packed(Table)

func _on_join_pressed() -> void:
	disable_buttons()
	MultiplayerManager.connect_to_server(player_name)
	get_tree().change_scene_to_packed(Table)


func disable_buttons()->void:
	$VBoxContainer/Host.disabled = true
	$VBoxContainer/Join.disabled = true
	$VBoxContainer.visible = false


func _on_line_edit_text_changed(new_text: String) -> void:
	player_name = new_text

func _on_line_edit_text_submitted(new_text: String) -> void:
	player_name = new_text

func _on_line_edit_text_change_rejected(_rejected_substring: String) -> void:
	player_name = ""
