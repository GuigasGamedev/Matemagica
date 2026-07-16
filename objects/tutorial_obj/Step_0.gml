if(global.gamefeel){
	smooth = smoothOriginal;
}else{
	smooth = 1;
}

if(instance_exists(player_obj) and instance_exists(tutorialArea_obj)){
	
	localizaColisao();
	
	imagemX = lerp(imagemX, player_obj.x, smooth);
	imagemY = lerp(imagemY, player_obj.y - 130, smooth);
	
		switch(estadoAnim){
	
		case(0):	//sumiu
			
			alpha = 0;
			animIndex = 0;
			
		break;
		case(1):	//aparecendo
		
			if(alpha < 1){
				alpha += alphaVel;
			}
			
			if(alpha >= 1){
				estadoAnim = 2
			}
		
		break;
		case(2):	//apareceu
			alpha = 1;
			
			var _indexMax = sprite_get_number(imagem) - 1;
			
			
			if(cont <= 0){
				cont = contMax;	
				if(animIndex < _indexMax){
					animIndex++;
				}else{
					animIndex = 0;	
				}
			}
				cont--;
		
		break;
		case(3):	//desaparecendo

			if(alpha > 0){
				alpha -= alphaVel;
			}
			
			if(alpha <= 0){
				estadoAnim = 0;
			}
		
		break;
	}
	
}