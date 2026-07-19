event_inherited();

floatTimer += 0.08;

if(global.gamefeel){
	if(criaPartTime <= 0){
	
		var _marg = 100;
	
		var _xMin = x - (sprite_get_width(bothBox1_spr)/2) - _marg;
		var _xMax = x + (sprite_get_width(bothBox1_spr)/2) + _marg;
		var _yMin = y - (sprite_get_height(bothBox1_spr)/2) - _marg;
		var _yMax = y + (sprite_get_height(bothBox1_spr)/2) + _marg;
	
		if(layer_exists("Particulas")){
			criaParticulas(PartRoxaCaixa_obj, _xMin, _xMax, _yMin, _yMax);
		}
	
		criaPartTime = criaPartMax;
	}

	criaPartTime--;
}

depth = -y;

hitbox.x = x;
hitbox.y = y;

//chamando a state machine no step para que ela seja executada a todo momento
stateMachine();

