extends Node

##Temp
const PORT:int = 8080
const HOST:String = "localhost"

var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()

signal connection(new_player:bool,player_name:String,id:int)

var players:Dictionary[int, String]

func create_server(player_name:String = "host")->void:
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	print("Server Created")
	players[multiplayer.get_unique_id()] = player_name

func connect_to_server( player_name:String = "player", ip:String = HOST,port:int = PORT)->void:
	var error:Error = peer.create_client(ip,port)
	multiplayer.multiplayer_peer = peer
	print("Connecting to server on port: %d" %PORT)
	if error == Error.OK:
		print("Connected Succefully")
		if player_name == "player":
			player_name += " %s" %str(multiplayer.get_unique_id())
		players[multiplayer.get_unique_id()] = player_name

func _on_peer_connected(id:int)->void:
	print("Peer Connected, ID: %s" %str(id))
	sync_players_info.rpc(players)
	connection.emit(true,"",id)

func _on_peer_disconnected(id:int)->void:
	print("Lost connection to Peer, ID: %s" %str(id))
	connection.emit(false,"",id)

@rpc("any_peer","call_remote","reliable")
func sync_players_info(player_list:Dictionary[int,String])->void:
	if !multiplayer.is_server():
		sync_players_info.rpc_id(1,players)
	for p_id in player_list.keys():
		if players.has(p_id):
			if players[p_id]  ==  player_list[p_id]:
				continue
			players[p_id] = player_list[p_id]
			continue
		else:
			players[p_id] = player_list[p_id]
			continue
