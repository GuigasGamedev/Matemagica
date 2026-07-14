if(abrindo){

	var _quantidade = instance_number(IntBox_obj);
	
	for(var _i = 0; _i < _quantidade; _i++){
		
		var _box = instance_find(IntBox_obj, _i);
		
		_box.canMove = 0;
		
	}
	
	timer--;
	
	if(timer<=0){
	
		instance_destroy(id);
	
	}
	
}