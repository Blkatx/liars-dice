extends Node2D


const ENEMY_PLAYER_SCN:PackedScene = preload("res://Resources/enemy_player.tscn")
@export var arena_width:int = 1000
@export var player_width:int = 150


func spawn_enemy(player_name:String = "",id:int = 0)->void:
	var id_match = get_children().filter(func(enemy:EnemyPlayer): return enemy.id == id)
	if !id_match.is_empty():
		push_error("ID already found")
	var instance:EnemyPlayer = ENEMY_PLAYER_SCN.instantiate()
	if !player_name.is_empty():
		instance.name = player_name
	else:
		instance.name = "ID %d" %id
	instance.id = id
	instance.player_name = player_name
	add_child(instance)
	position_enemies()

func remove_enemy(id:int)->void:
	var id_match = get_children().filter( func(enemy:EnemyPlayer): return enemy.id == id)
	if id_match.is_empty():
		return
	for node:Node in id_match:
		node.queue_free()


func position_enemies()->void:
	var enemies:Array[Node] = get_children()
	var count:int = get_child_count()
	for i in range(count):
		var pos = ((i/float(count)) * arena_width)
		enemies[i].position.x = pos


func _on_child_entered_tree(_node: Node) -> void:
	print("new node name is " + _node.name)
	position_enemies()
