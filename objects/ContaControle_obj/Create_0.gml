contaFinal = noone;
caixas = [];

pegaConta = function(){

	

	for (var i = 0; i < instance_number(IntBox_obj); ++i){
		caixas[i] = instance_find(IntBox_obj,i);
	}

	for (var i = 0; i < instance_number(IntBox_obj); ++i){
		for (var j = 0; j < instance_number(IntBox_obj); ++j){
		
			if(place_meeting(caixas[i].x, caixas[i].y, caixas[j]) and i != j){
			
				show_message("bateu");
			
			}
			
		}
	}
	
}