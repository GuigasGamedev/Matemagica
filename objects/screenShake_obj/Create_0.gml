if(instance_exists(portal_obj)){
	trueX = portal_obj.x - camera_get_view_width(view_camera[0]) / 2;
	trueY = portal_obj.y - camera_get_view_height(view_camera[0]) / 2;
}else if(instance_exists(EntreSalas_obj)){
	trueX = portal_obj.x - camera_get_view_width(view_camera[0]) / 2;
	trueY = portal_obj.y - camera_get_view_height(view_camera[0]) / 2;
}

shake = false;
shake_time = 0;
shake_magnitude = 0;
shake_fade = 0.25;