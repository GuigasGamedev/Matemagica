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

function screenshake(_time, _magnitude, _fade){
   with (screenShake_obj)
   {
      shake = true;
      shake_time = _time;
      shake_magnitude = _magnitude;
      shake_fade = _fade;
   }
}

function teleporte(){

	if(!instance_exists(tpControl_obj)){
		if(layer_exists("Control")){
			if(!instance_exists(player_obj)){
				if(layer_exists("Player")){
					
					var _player = instance_create_layer(portal_obj.x, portal_obj.y, "Player", player_obj);
					_player.canControl = 0;
					_player.visivel = 0;
			
					instance_create_layer(0, 0, "Control", tpControl_obj);
				}
			}
		}
	}
}

function trocaSala(){

	if(!instance_exists(tpSala_obj)){
		if(layer_exists("Control")){
					instance_create_layer(0,0, "Control", tpSala_obj);
		}
	}
}

function chegaSala(){
	
	if(instance_exists(tpSala_obj)){
		if(layer_exists("Player")){
			if(!instance_exists(player_obj)){
				if(instance_exists(EntreSalas_obj)){
			
					var _objChegada = noone;
					var _inst = [];
			
					var _num = instance_number(EntreSalas_obj);
				
					for(var _i = 0; _i < _num; _i++){
						_inst[_i] = instance_find(EntreSalas_obj, _i);
					}
			
					for(var _i = 0; _i < _num; _i++){
						if(_inst[_i].chegada){
							_objChegada = _inst[_i];	
						}
					}
				
					instance_create_layer(_objChegada.x, _objChegada.y - 50, "Player", player_obj);
					//player_obj.estado = 5;
				}
			}
		}
	}
}