// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function network_sendplayerupdate(argument0){
	buffer_seek(obj_client.buffer, buffer_seek_start, 0)
	buffer_write(obj_client.buffer, buffer_text, json_stringify(argument0))
	network_send_raw(obj_client.tcp_socket, obj_client.buffer, string_byte_length(json_stringify(argument0)), network_send_binary)
}


