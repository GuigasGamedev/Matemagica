
//quando o objeto colide com a hitbox, ele executa o método de parar caixa
parandoObj(limitHitBox_obj);

if(highlight){	//se apos a caixa parar, ela ainda for a selecionada
				//o estado dela vira 4 (abaixando luz)
	estado = 4;
}else{
	estado = 6;	//se ela não for mais a selecionada, 
				//o estado dela vira 6 (desligando)
}
	