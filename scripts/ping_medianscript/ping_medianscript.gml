// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.pings_array = [] // last 10 pings received
global.median_pings = [] // last 10 pings received sorted


function ping_median(argument0){
	if array_length(global.pings_array) == 10{ // if array has 10 pings then delete one
		array_delete(global.pings_array, 0, 1)
		array_push(global.pings_array, argument0);
		
	}  // if array doesn't have 10 pings yet so just add to the end of the array
	else if array_length(global.pings_array) < 10 {
		array_push(global.pings_array, argument0);
	}
	
	// get median
	// copy array
	
	var _array=global.pings_array

	for(var _i=0;_i<array_length(_array)  ;_i++)
	{
	  global.median_pings[_i]=_array[_i];
	}
	
	// sort and get meddian
	array_sort(global.median_pings, true)
	if array_length(global.median_pings) >= 5{
		var med_ping = global.median_pings[@ 4]
	}
	else{
		var med_ping = array_last(global.median_pings)	
	}
	show_debug_message(global.pings_array)
	
	return med_ping
}




