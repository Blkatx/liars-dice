extends Node

##Temp
const PORT:int = 8080
const HOST:String = "localhost"

var peer:ENetMultiplayerPeer = ENetMultiplayerPeer.new()

signal connection(new_player:bool,player_name:String,id:int)

func create_server()->void:
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_connected)
	multiplayer.peer_disconnected.connect(_on_peer_disconnected)
	print("Server Created")

func connect_to_server(ip:String = HOST,port:int = PORT)->void:
	var error:Error = peer.create_client(ip,port)
	multiplayer.multiplayer_peer = peer
	print("Connecting to server on port: %d" %PORT)
	if error == Error.OK:
		print("Connected Suscefully")
		await get_tree().process_frame
		print(get_tree().current_scene)


func _on_peer_connected(id:int)->void:
	print("Peer Connected, ID: %s" %str(id))
	connection.emit(true,"",id)


func _on_peer_disconnected(id:int)->void:
	print("Lost connection to Peer, ID: %s" %str(id))
	connection.emit(false,"",id)
