
	var _cam_x = player_obj.x - camera_get_view_width(view_camera[0]) / 2;
	var _cam_y = player_obj.y - camera_get_view_height(view_camera[0]) / 2;
	
	var _smooth = .2;
	
	trueX = lerp(trueX, _cam_x, _smooth);
	trueY = lerp(trueY, _cam_y, _smooth);

if (shake){ 
	shake_time --; 
   
	var _xval = choose(-shake_magnitude, shake_magnitude); 
	var _yval = choose(-shake_magnitude, shake_magnitude); 
	
	camera_set_view_pos(view_camera[0], round(_xval + _cam_x), round(_yval + _cam_y)); 

	if (shake_time <= 0){ 
		shake_magnitude -= shake_fade; 

		if (shake_magnitude <= 0){ 
			if(instance_exists(player_obj)){ 
				camera_set_view_pos(view_camera[0], round(_cam_x), round(_cam_y)); 
			}else{
				camera_set_view_pos(view_camera[0], 0, 0); 		 
			}
		shake = false; 
      } 
   } 
}else{
	if(instance_exists(player_obj)){ 
		if(global.gamefeel){
			camera_set_view_pos(view_camera[0], round(trueX), round(trueY)); 
		}else{
			camera_set_view_pos(view_camera[0], round(_cam_x), round(_cam_y)); 
		}
	}
}