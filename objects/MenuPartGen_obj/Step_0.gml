if(global.gamefeel){

	if(timer <= 0){

		timer = timerMax;
		gerando = 1;
	
	}

	if(gerando = 1){

		for(var _i = 0; _i < 30; _i++){
			criaParticulas(MenuPart_obj, xRang1, xRang2, yRang1, yRang2);
		}
	
		gerando = 0;
	
	}

	timer--;
	
}