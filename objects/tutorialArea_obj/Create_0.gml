colidiu = 0;

detectaColisao = function(){

	if(instance_exists(player_obj)){
	
		if(place_meeting(x, y, player_obj)){
		
			colidiu = 1;
		
		}else{
		
			colidiu = 0;
		
		}
		
	}
	
}