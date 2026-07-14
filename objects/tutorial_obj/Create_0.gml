tutoNum = 0;
tutoriais = [];

if(instance_exists(player_obj) and instance_exists(tutorialArea_obj)){
	
		tutoNum = instance_number(tutorialArea_obj);
		
		for (var _i = 0; _i < tutoNum; _i++){
			tutoriais[_i] = instance_find(tutorialArea_obj, _i);
		}
	
}
	

localizaColisao = function(){

	for(var _i = 0; _i < tutoNum; _i++){
	
		if(tutoriais[_i].colidiu = 1){
		
			show_debug_message("Colidiu");
		
		}else{
		
			show_debug_message("nao colidiu");
		
		}
	
	}

}