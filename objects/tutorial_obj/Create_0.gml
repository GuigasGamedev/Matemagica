imagem = noone;
alpha = 0;
alphaVel = 0.08;


animIndex = 0;
cont = 0;
contMax = 20;

estadoAnim = 0;

smooth = 0.7;
imagemX = 0;
imagemY = 0;
	

localizaColisao = function(){
		
		if(global.colisaoTutorial){
		
			imagem = alteraImagem(global.estagioTutorial);
			if(estadoAnim == 0){
				estadoAnim = 1;
			}
		}else{
		
			estadoAnim = 3;
		
		}
}



	


alteraImagem = function(_estagio){

	switch(_estagio){
	
		case(0):
			return WASD_spr;
		case(1):
			return Shift_spr;
		case(2):
			return TeclaQ_spr;
		case(3):
			return TeclaE_spr;
		case(4):
			return TeclaF_spr;
	
	}
	
}