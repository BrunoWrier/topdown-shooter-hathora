/// @description Insert description here
// You can write your code in this editor

x = round(lerp(x, xx, 0.5))
y = round(lerp(y, yy, 0.5))
image_angle += angle_difference(anglee, image_angle) * 0.8;

if idd == obj_client.yourplayerId{ // player movements
	
	
	if instance_exists(camera) camera.target = id
	
	#region movement
	// {"type":0,"direction":2}
	if keyboard_check(ord("W")){
		// send to the server
		direction_struct[$ "direction"] = Direction.Up
		
	}
	else if keyboard_check(ord("D")){
		// send to the server
		direction_struct[$ "direction"] = Direction.Right
		
	}
	else if keyboard_check(ord("S")){
		// send to the server
		direction_struct[$ "direction"] = Direction.Down
		
	}
	else if keyboard_check(ord("A")){
		// send to the server	
		direction_struct[$ "direction"] = Direction.Left
		
	}
	else{
		direction_struct[$ "direction"] = Direction.None
		
	}
	
	network_sendplayerupdate(direction_struct)
	
	
	#endregion
	
	#region angle
	
	var angle = darctan2(y - mouse_y, mouse_x - x);
	angle_struct[$ "angle"] = angle * -pi/180
	
	network_sendplayerupdate(angle_struct)
	
	#endregion
	
	
	
	#region shooting
	
	if mouse_check_button_pressed(mb_left){
		// send to the server
		
		network_sendplayerupdate(bullet_struct)
	}
	
	#endregion
	
	#region ping
	
	current_mytime = unix_timestamp()
	structPING = {
	"type": ClientMessageType.Ping,
	"id": current_mytime
	}
	
	network_sendplayerupdate(structPING)
	
	#endregion
	
	
}








