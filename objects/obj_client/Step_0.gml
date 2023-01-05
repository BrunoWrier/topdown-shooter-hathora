/// @description Insert description here
// You can write your code in this editor


if create_id == ""{
	if global.my_text != ""{
		roomId = global.my_text
	}
	else{
		// roomId = "2mjggrxk9kmn8"
		tryConnectroom = false
	}
}

structDATA = {	
	"token": token,
	"stateId": roomId
	};

if tryConnectroom{
	if timer == 0{
	connect = network_connect_raw_async(tcp_socket, ipConnect, port)
	}
	timer += 1
	
	if connect != -1 && timer >= 40{
		current_mytime = 0
		
		buffer_seek(buffer, buffer_seek_start, 0)
	
		buffer_write(buffer, buffer_string, json_stringify(structDATA))
		// show_debug_message(buffer)
		// show_debug_message(json_stringify(structDATA))
		
		network_send_raw(tcp_socket, buffer, string_byte_length(json_stringify(structDATA)), network_send_binary)//, buffer_tell(buffer))
		tryConnectroom = false
		
		// room_goto(Room1)
	}
}

if tryCreateroom{
	map = ds_map_create()
	ds_map_add(map, "Authorization", token);
	ds_map_add(map, "Content-Type", "application/octet-stream");
	create_id = http_request("https://"+ip+"/"+appId+"/create", "POST", map, "")
	tryCreateroom = false
}

if token != "" && yourplayerId == ""{
	var split_token = string_split(token, ".")
	yourplayerId = base64_decode(split_token[1])
	yourplayerId = json_parse(yourplayerId)
	yourplayerId = yourplayerId[$ "id"]
	show_debug_message(yourplayerId)
}

if connect != -1{
	if time_out < 180 time_out += 1

	if room != Room1 && time_out >= 180{
		network_destroy(tcp_socket)
		show_message_async("Unable to connect to the room! Maybe the room doesn't exist?")
		instance_destroy(self)
	}
}