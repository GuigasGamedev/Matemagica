function funcoesTexto(_fonte, _cor, _alinhamentoV, _alinhamentoH){

	draw_set_font(_fonte);
	draw_set_colour(_cor);
	draw_set_valign(_alinhamentoV);
	draw_set_halign(_alinhamentoH);

}

function zeraTexto(){

	draw_set_font(-1);
	draw_set_colour(-1);
	draw_set_valign(-1);
	draw_set_halign(-1);
	
}

function transicao(_room, _escolha){

	global.roomDest = _room;
	
	if(_escolha){
		if(!instance_exists(Transicao_obj)){
						
			instance_create_layer(0, 0, "Transicao", Transicao_obj);
						
		}
	}else{
		room_goto(global.roomDest);	
	}
}