class_name GameTable
extends CanvasLayer

## Responsible for keeping track of turn order.
@onready var enemy_player_spawner: Node2D = $EnemyPlayerSpawner
@onready var player: Node2D = $Player

@export var number_of_players:int = 2

const TRAY_SCN:PackedScene = preload("res://tray.tscn")

func _ready() -> void:
	##Inits the table with no enemies
	for child:Node2D in enemy_player_spawner.get_children():
		child.queue_free()

	MultiplayerManager.connection.connect(_on_multiplayer_connection)
	#for i:int in number_of_players :
		#if i == 0:
			#player.add_child(TRAY_SCN.instantiate())
			#continue
		#enemy_player_spawner.spawn_enemy("Enemy %d" %(i), (i+10) )



##Spawn and DeSpawn player
func _on_multiplayer_connection(new_player:bool,player_name:String, id:int)->void:
	if new_player:
		number_of_players += 1
		enemy_player_spawner.spawn_enemy(player_name,id)
	else:
		print("Removing Player ID: %d" %id )
		number_of_players -= 1
		enemy_player_spawner.remove_enemy(id)
