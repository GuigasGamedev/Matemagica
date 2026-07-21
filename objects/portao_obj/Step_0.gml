if(!abrindo){

	floatTimer += 0.08;
	
}

if(abrindo){

	var _quantidade = instance_number(IntBox_obj);
	
	for(var _i = 0; _i < _quantidade; _i++){
		
		var _box = instance_find(IntBox_obj, _i);
		
		_box.canMove = 0;
		
	}
	
	subimage = 1;
	
	timer1--;
	
	if(timer1<=0){
		
		var _xmin = x - sprite_get_width(portao_spr)/2;
		var _xmax = x + sprite_get_width(portao_spr)/2;
		var _ymin = y - sprite_get_width(portao_spr)/2;
		var _ymax = y + sprite_get_width(portao_spr)/2;
		
		criaParticulas(PartBPortao_obj, _xmin, _xmax, _ymin, _ymax);
		
		timer2--;
		alphaBranco += .03;
		
		if(timer2 <= 0){
			
			for(var _i = 0; _i < 20; _i++){
				criaParticulas(PartEstPortao_obj, x, x, y, y);
			}
			
			instance_destroy(id);
		}
	
	}
	
}