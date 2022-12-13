/// @description Insert description here
// You can write your code in this editor

draw_self()
draw_set_color(c_black)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed(x,y,global.my_text + cursor,1.4,1.4,0)
draw_set_halign(fa_left)

if global.my_text == "" && can_write == false{
	draw_text_transformed(x-46,y,"Room ID",1.4,1.4,0)	
}





