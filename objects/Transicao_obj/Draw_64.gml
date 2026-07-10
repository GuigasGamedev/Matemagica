for(var i = 0; i < lin; i++){

	for(var j = 0; j < colu; j++){
		
		var _img = min(max(0, imgIndex - i), imgNum);
	
		draw_sprite_ext(TransicaoQuad_spr, _img, j * tamanho, i * tamanho,1, 1, 0, c_black, 1); 
	
	}
	
}