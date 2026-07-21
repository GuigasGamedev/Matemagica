if(chegada){
	draw_sprite_ext(portal_spr, 0, x, y, 2, 2, 0, c_white, 1);	
}else{

	if(estagio = 1){
	
		draw_sprite_ext(PortalMais_spr, 0, x, y, 2, 2, 0, c_white, 1);
	
	}
	if(estagio = 2){
	
		draw_sprite_ext(PortalMenos_spr, 0, x, y, 2, 2, 0, c_white, 1);
	
	}
	if(estagio = 3){
	
		draw_sprite_ext(PortalMulti_spr, 0, x, y, 2, 2, 0, c_white, 1);
	
	}
	if(estagio = 4){
	
		draw_sprite_ext(PortalDiv_spr, 0, x, y, 2, 2, 0, c_white, 1);
	
	}
	
}