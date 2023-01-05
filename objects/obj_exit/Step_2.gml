/// @description Insert description here
// You can write your code in this editor


var cam_id = view_camera[0]
var cam_x = camera_get_view_x(cam_id)
var cam_y = camera_get_view_y(cam_id);

x = xDifference + cam_x
y = yDifference + cam_y



if place_meeting(x, y, obj_mouse) && mouse_check_button_pressed(mb_left){
	with obj_client{
		network_destroy(tcp_socket)
		instance_destroy(self)
	}	
}




