/// @description Insert description here
// You can write your code in this editor

#region ping
	
	// current_mytime = unix_timestamp()
	obj_client.current_mytime = current_time // get_timer() / 1000 // unix_timestamp()
	// obj_client.my_ping = obj_client.current_mytime - obj_client.received_mytime
	var temp_ping = obj_client.current_mytime - obj_client.received_mytime
	show_debug_message(temp_ping)
	obj_client.my_ping = ping_median(temp_ping)
	show_debug_message(floor(obj_client.my_ping/2))
	structPING = {
	"type": ClientMessageType.Ping,
	"id": obj_client.current_mytime
	}
	
	network_sendplayerupdate(structPING)
	
	#endregion









