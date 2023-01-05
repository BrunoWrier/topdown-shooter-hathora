/// @description Insert description here
// You can write your code in this editor

// Getting token

if async_load[? "id"] == get_token{
	// show_debug_message("got token= " + async_load[? "result"])
	var tokenstruct = json_parse(async_load[? "result"])
	token = tokenstruct[$"token"]
	show_debug_message(token)

}

if async_load[? "id"] == create_id{
	show_debug_message("got id= " + async_load[? "result"])
	var idsctruct = json_parse(async_load[? "result"])
	roomId = idsctruct[$"stateId"]
	show_debug_message(roomId)
	tryConnectroom = true
}