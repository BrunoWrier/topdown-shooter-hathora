/// @description Insert description here
// You can write your code in this editor


if async_load[? "type"] == network_type_data{ // data received
	
	global.connectedANDreceiving = true
	
	var packet = async_load[? "buffer"];
	var bufferpacket = buffer_read(packet, buffer_string)
	
	var struct = json_parse(bufferpacket)
	
	
	if struct.type == 0{
	#region players
	
	var playersarray = struct.state.players
	
	for(var i = 0; array_length(playersarray) > i; i++){ // FOR EACH PLAYER
		
		var playerid = struct.state.players[@ i].id
		var playerx = struct.state.players[@ i].position.x
		var playery = struct.state.players[@ i].position.y
		var playerangle = struct.state.players[@ i].aimAngle
		
		if(ds_map_exists(ds_players, playerid)){
				var obj = ds_players[? playerid]
				obj.xx = playerx//lerp(x, playerx, .80)
				obj.yy = playery//lerp(y, playery, .80)
				obj.anglee = playerangle * - (180 / pi)
				obj.idd = playerid
			}else{			
				var obj = instance_create_depth(playerx,playery,0,obj_player)
				ds_map_add(ds_players, playerid, obj)
			}
	}
	// check if ds map player is not in the data
	for (var k = ds_map_find_first(ds_players); !is_undefined(k); k = ds_map_find_next(ds_players, k)) {
	  var v = ds_players[? k];
	  var delete_player = true
	  /* Use k, v here */
		for(var i = 0; array_length(playersarray) > i; i++){
			var playerid = struct.state.players[@ i].id
			if k == playerid delete_player = false
		}
	if delete_player{
		with(obj_player){
			if idd == k instance_destroy(self)	
		}
		ds_map_delete(ds_players,k)	
	}
	}
	
	#endregion
	
	#region bullets
	
	var bulletsarray = struct.state.bullets
	
	if array_length(bulletsarray) != 0{
	
		for(var i = 0; array_length(bulletsarray) > i; i++){ // FOR EACH BULLET
		
			var bulletid = struct.state.bullets[@ i].id
			var bulletx = struct.state.bullets[@ i].position.x
			var bullety = struct.state.bullets[@ i].position.y
			//var bulletangle = instance_nearest(bulletx, bullety, obj_player).image_angle
		
			if(ds_map_exists(ds_bullets, bulletid)){
				var obj = ds_bullets[? bulletid]
				obj.xx = bulletx //lerp(bulletx, x, 0.25)
				obj.yy = bullety //lerp(bullety, y, 0.25)
				//obj.image_angle = bulletangle
			}else{
				var obj = instance_create_depth(bulletx,bullety,0,obj_bullet)
				obj.idd = bulletid
				ds_map_add(ds_bullets, bulletid, obj)
			}
		}
	}
	
	// check if ds map bullet is not in the data
	for (var k = ds_map_find_first(ds_bullets); !is_undefined(k); k = ds_map_find_next(ds_bullets, k)) {
	  var v = ds_bullets[? k];
	  var delete_it = true
	  /* Use k, v here */
		for(var i = 0; array_length(bulletsarray) > i; i++){
			var bulletid = struct.state.bullets[@ i].id
			if k == bulletid delete_it = false
		}
	if delete_it{
		with(obj_bullet){
			if idd == k instance_destroy(self)	
		}
		ds_map_delete(ds_bullets,k)	
	}
	}
	
	#endregion
	}
	else if struct.type == 1{
		// get ping
		received_mytime = struct.id
	}

		
}
else{
	global.connectedANDreceiving = false
}

