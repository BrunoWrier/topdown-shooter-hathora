/// @description Insert description here
// You can write your code in this editor
if can_write{
	if keyboard_check(vk_anykey) and string_length(global.my_text) < 20{
	    global.my_text = global.my_text+string(keyboard_string)
	    keyboard_string = ""
	}

	if keyboard_check(vk_backspace) and !keyboard_check_pressed(vk_backspace) and delete_timer = 2{
	    global.my_text = string_delete(global.my_text,string_length(global.my_text),1)
	    delete_timer = 0
	    keyboard_string = ""
	}

	if keyboard_check_pressed(vk_backspace){
	    global.my_text = string_delete(global.my_text, string_length(global.my_text),1)
	    keyboard_string = ""
	    delete_timer = -4
	}
	
	if keyboard_check(vk_control) && keyboard_check(ord("V")){
		if paste_timer == 0 or paste_timer >= 1 * room_speed{
			global.my_text = global.my_text+clipboard_get_text()
		    keyboard_string = ""
		}
		paste_timer += 1
	}
	else paste_timer = 0

	if delete_timer != 2{
	    delete_timer ++    
	}

	if cursor_timer >= 60{
		if cursor == "|" cursor = " "
		else if cursor == " " cursor = "|"
		cursor_timer = 0
	}
	cursor_timer += 2
}
else{
	cursor = " "
	keyboard_string = ""
}

if place_meeting(x, y, obj_mouse){
	if mouse_check_button_pressed(mb_left){
		can_write = true
		cursor = "|"
		cursor_timer = 0
	}
}
else{
	if mouse_check_button_pressed(mb_left){
		can_write = false
	}	
}



