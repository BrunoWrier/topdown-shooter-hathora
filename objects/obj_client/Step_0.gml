/// @description Insert description here
// You can write your code in this editor
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
		buffer_seek(buffer, buffer_seek_start, 0)
	
		buffer_write(buffer, buffer_string, json_stringify(structDATA))
		// show_debug_message(buffer)
		// show_debug_message(json_stringify(structDATA))
		
		network_send_raw(tcp_socket, buffer, string_byte_length(json_stringify(structDATA)), network_send_binary)//, buffer_tell(buffer))
		tryConnectroom = false
	}
}

