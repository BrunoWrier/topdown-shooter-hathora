/// @description Insert description here
// You can write your code in this editor

// Global variables
global.connectedANDreceiving = false
global.connectedTOroom = false

// Random variables
tryConnectroom = false
tryCreateroom = false
joinCreatedroom = false
roomId = ""

// Buffer
buffer = buffer_create(32, buffer_grow, 1)

// Network Variables
port = 443
ip = "coordinator.hathora.dev"
ipConnect = "wss://coordinator.hathora.dev/connect/e2d8571eb89af72f2abbe909def5f19bc4dad0cd475cce5f5b6e9018017d1f1c"
ping = 0;
appId = "e2d8571eb89af72f2abbe909def5f19bc4dad0cd475cce5f5b6e9018017d1f1c"

token = ""
yourplayerId = ""

// ping

current_mytime = unix_timestamp()
received_mytime = 0
my_ping = 0

// Socket creation and connect to the server
tcp_socket = network_create_socket(network_socket_ws)
connect = -1

get_token = http_request("https://"+ip+"/"+appId+"/login/anonymous", "POST", async_load, "")
create_id = ""

// timer
timer = 0

// players
ds_players = ds_map_create()
ds_bullets = ds_map_create()



