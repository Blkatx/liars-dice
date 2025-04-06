extends Control


const ENEMY_PLAYER_SCN:PackedScene = preload("res://Resources/enemy_player.tscn")
@export var arena_width:int = 1000
@export var player_width:int = 150


func spawn_enemy(player_name:String = "",id:int = 0)->void:
	var id_match = get_children().filter(func(enemy:EnemyPlayer): return enemy.id == id)
	if !id_match.is_empty():
		#push_error("ID:%s already found" %str(id))
		return
	var instance:EnemyPlayer = ENEMY_PLAYER_SCN.instantiate()
	instance.name = str(id)
	instance.id = id
	instance.player_name = player_name
	add_child(instance)

func remove_enemy(id:int)->void:
	var id_match = get_children().filter( func(enemy:EnemyPlayer): return enemy.id == id)
	if id_match.is_empty():
		return
	for node:Node in id_match:
		node.queue_free()




func _on_child_entered_tree(_node: Node) -> void:
	print("new node name is " + _node.name)
