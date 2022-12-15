/// @description Insert description here
// You can write your code in this editor

var array_size = array_length(walls)

for(var i = 0; array_size > i; i++){
	
	var arrayindex = walls[@ i]
	show_debug_message(arrayindex)
	
	var wall_x = arrayindex[$ "x"]
	var wall_y = arrayindex[$ "y"]
	var wall_width = arrayindex[$ "width"]
	var wall_height = arrayindex[$ "height"]
	
	draw_sprite_stretched(spr_yellowbox, 0, wall_x*60, wall_y*50, wall_width*80, wall_height*80)
	
}









