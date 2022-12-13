/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white)
draw_text(40, 40,"connection: " + string(connect))
draw_text(40, 60, "Receiving data: " + string(global.connectedANDreceiving))

if room == Room1{
	draw_text_transformed(80, 700, "Lobby: " + roomId, 2, 2, 0)
}





