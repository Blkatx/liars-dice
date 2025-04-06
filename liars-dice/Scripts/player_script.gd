class_name Player
extends Node2D

var player_name:String = ""
var id:int = 1

func _ready()->void:
	add_to_group(&"Players")
	if multiplayer.has_multiplayer_peer():
		id = multiplayer.get_unique_id()
