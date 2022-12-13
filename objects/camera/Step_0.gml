/// @description Insert description here
// You can write your code in this editor

var cam_id = view_camera[0]
var cam_width = camera_get_view_width(cam_id);
var cam_height = camera_get_view_height(cam_id);

if target != undefined && instance_exists(target){
	x += (target.x - x)// * 0.1;
	y += (target.y - y)// * 0.1;
}



camera_set_view_pos(cam_id, x-cam_width*0.5, y-cam_height*0.5);
camera_set_view_pos(cam_id,
                   clamp( camera_get_view_x(cam_id), 0, room_width - camera_get_view_width(cam_id) ),
                   clamp( camera_get_view_y(cam_id), 0, room_height - camera_get_view_height(cam_id) ));
camera_set_view_speed(cam_id, 2*room_speed, 2*room_speed);









