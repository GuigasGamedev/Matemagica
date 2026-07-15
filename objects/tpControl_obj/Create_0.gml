timer = global.tptimer;

animacaoTp = function(){

	timer--;
	if(timer <= 0){
	
		if(instance_exists(player_obj)){
		
			with(player_obj){
			
				visivel = 1;
				canControl = 1;
			
			}
			
		}
	
		if(instance_exists(tutorial_obj)){
		
			global.tutoriais = 1;
		
		}
		
		instance_destroy(id);
	
	}
	
}