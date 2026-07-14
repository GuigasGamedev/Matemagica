
#region variáveis

vida = 1;				//vida (obvio)
vel = 4;				//velocidade
velDash = 1;			//velocidade do dash
velDashMax = 5;			//velocidade máxima do dash
dashCD = 0;				//cooldown do dash
dashCDMAX = 45;			//cooldown máxdo dash
dashDuration = 15;		//duração do dash
dashDurationTimer = 0;	//timer da duração do dash
rangeInt = 1250;

estado = 0;				//estado para state machine
estadoLado = 0;			//estado de lado para state machina

ragdollTimer = 0;
ragdollTimerMax = 20;
ragdoll = 0.07;

visivel = 1;

canControl = 1;			//variavel para determinar se o jogador pode controlar o personagem
canControlCD = 0;		//cooldown de controle     (essa variável serve para travar o jogador por um pequeno momento após interagir com um obj)
canControlCDMAX = 15;	//cooldown max de controle

interCD = 0;			//variavel para determinar se o jogador pode interagir com os objetos
interCDMax = 60;		//tempo máx para o jogador interagir com algo novamente

objId = noone;			//variável que guarda o id do objeto selecionado

box = [];
colisions = [];

//modifica o vetor box para cada valor ser um id de alguma caixa na room
//talvez esse método funcione com esse for fora do objeto caixa
for (var i = 0; i < instance_number(IntBox_obj); ++i){
	box[i] = instance_find(IntBox_obj,i);
}

#endregion

//método geral
control = function(){
	
		movimento(canControl);		//chamando o método de movimento
		objId = objIdGet();			//chamando o método boxIdGet() para dar um retorno de id ao boxId
		objetoExiste = objIdGet();
		
		//chamando os métodos de interação 
		pull(canControl, objId, objetoExiste);	
		push(canControl, objId, objetoExiste);
		
		//lista de objetos que o jogador pode colidir dependo do estado do jogador
		colisions = [intPai_obj, limitHitBox_obj];
		
		checaEmpurrao();
		//stateMachine(estado, estadoLado);
			
		//debug para ligar ou desligar o gamefeel
		var _gamefeel = keyboard_check_pressed(ord("O"));
		if(_gamefeel){
			global.gamefeel = !global.gamefeel;	
		}
			
			
}

#region métodos de interação

//método que retorna o id de algum objeto
objIdGet = function(){
	
	var _mousex = mouse_x;
	var _mousey = mouse_y;
	
	//se a camada Obj  existee...
	if(layer_exists("Obj")){
		if(instance_exists(intPai_obj)){
			//mouse
			if(place_meeting(_mousex, _mousey, boxHitbox_obj)){
				for (var i = 0; i < instance_number(intPai_obj); ++i){
					if(place_meeting(_mousex, _mousey, box[i].hitbox)){
						var _obj = box[i].id;	
						with(_obj){
							variable_instance_set(_obj, "highlight", 1);	//seta o highlight do obj em questao para 1
							zeroHigh();										//ativa o método que zera o highlight dos outros objetos
						}
					}
				}
			//obj mais próximo
			}else{
				var _obj = instance_nearest(x, y, intPai_obj);	//a variavel temporária _obj recebe o obj mais próximo
			
				//interagindo com o objeto
				with(_obj){
						variable_instance_set(_obj, "highlight", 1);	//seta o highlight do obj em questao para 1
						zeroHigh();										//ativa o método que zera o highlight dos outros objetos
				}	
			}
				//retorna o id deste objeto
				return _obj;
		}
		else {
			return 	noone;
		}
	}else{
		return noone;	
	}
	
}

//metodo para verificar se existem objetos interagiveis na sala
objExist = function(){

	if(instance_exists(IntBox_obj)){
		return 1;	
	}else{
		return 0;
	}
	
}

//método que puxa um objeto
pull = function(_andar, _obj, _exist){ //recebe um booleano (canControl) e um id (boxId)
	
	//Se objetos interagiveis existirem...
	if(_exist and distance_to_object(_obj) < rangeInt){
		
		//booleana para detectar se uma tecla foi apertada (E neste caso)
		var _pull = keyboard_check_pressed(ord("E"));
		
		//o código só executa se o tipo da caixa for o correto
		if(_obj.tipo == "pull" or _obj.tipo == "both"){
			if(_andar){ //se o jogador consegue se controlar...
			
				if(_pull && interCD == 0){ //se a tecla (E) foi apertada e o cooldown de interação for 0...
					
					estado = 3;
					canControl = 0;						//tira o controle do jogador
					canControlCD = canControlCDMAX;		//seta o cd do controle para o cdMax
				
					if(instance_exists(intPai_obj)){	//confere se a instancia existe... (Telvez essa verificação fique melhor antes)
					
						//com a caixa
						with(_obj){
							puxando = 1;	//Ativa o método de puxar dentro da caixa
						}
					
						//seta o cd da interação para o máximo
						interCD = interCDMax;
					}
				}
			}
			
			//diminui os contadores de cooldown
			if(interCD > 0){
				interCD -= 1;	
			}
		
			if(canControlCD > 0){
				canControlCD -= 1;
				if(canControlCD == 0){
					canControl = 1;	
					estado = 0;
				}
			}
		}	
	}
		
}

//método que empurra um objeto
push = function(_andar, _obj, _exist){ //recebe um booleano (canControl) e um id (boxId)
	
	//Se objetos interagiveis existirem...
	if(_exist and distance_to_object(_obj) < rangeInt){
		
		//booleana para detectar se uma tecla foi apertada (Q neste caso)
		var _push = keyboard_check_pressed(ord("Q"));
		
		//o código só executa se o tipo da caixa for o correto
		if(_obj.tipo == "push" or _obj.tipo == "both"){
			if(_andar){ //se o jogador consegue se controlar...
			
				if(_push && interCD == 0){ //se a tecla (Q) foi apertada e o cooldown de interação for 0...
				
					estado = 3;
					canControl = 0;						//tira o controle do jogador
					canControlCD = canControlCDMAX;		//seta o cd do controle para o cdMax
				
					if(instance_exists(intPai_obj)){	//confere se a instancia existe... (Telvez essa verificação fique melhor antes)
					
						//com a caixa
						with(_obj){
							empurrando = 1;	//Ativa o método de puxar dentro da caixa
						}
					
						//seta o cd da interação para o máximo
						interCD = interCDMax;
					}
				}
			}
		
			//diminui os contadores de cooldown
			if(interCD > 0){
				interCD -= 1;	
			}
		
			if(canControlCD > 0){
				canControlCD -= 1;
				if(canControlCD == 0){
					canControl = 1;	
					estado = 0;
				}
			}
		}	
	}
}

#endregion

#region metodos de movimentação ou animação

//método de movimentação do jogador
movimento = function(_andar){	//recebe uma booleana para saber se o jogador pode andar	
	
	//detecta booleanas para teclas do teclado para setar os comandos
	var _up = keyboard_check(ord("W"));
	var _down = keyboard_check(ord("S"));
	var _left = keyboard_check(ord("A"));
	var _right = keyboard_check(ord("D"));
	var _dash = keyboard_check_pressed(vk_shift);
	
	//se o jogador consegue controlar...
	if(_andar){	
			if(_dash && dashCD == 0){	//se a tecla de dash for apertada e o cooldown do dash for 0...
	
				velDash = velDashMax;				//velocidade do dash recebe a velocidade de dash máxima
				dashCD = dashCDMAX;					//aumenta o cd do dash
			
				dashDurationTimer = dashDuration;	//aumenta o tempo da duração do dash
	
			}
		
				if(dashDurationTimer > 0){	//enquando a duração do dash for maior que zero...
						dashDurationTimer -= 1;	
						if(dashDurationTimer == 0){	
							velDash = 1;	//quando a duração terminar, volta a velocidade do dash para 1;
							estado = 0;
						}
					}
		
		
			//se o cd do dash for maior que 0, o cd diminui com o tempo		
			if(dashCD > 0){
				dashCD = dashCD - 1;	
			}
			
		//verificando se as teclas forem apertadas para andar
		//de acordo com o calculo de angulo pelo lenghdir
		//up e down nao podem ser apertados ao mesmo tempo e nem left e right
		if(_up xor _down or _left xor _right){
			
			if(_down){
				estadoLado = 0;	
			}
			if(_right){
				estadoLado = 1;	
			}
			if(_up){
				estadoLado = 2;	
			}
			if(_left){
				estadoLado = 3;	
			}
			
			if(dashDurationTimer > 0){
				estado = 2
			}else{
				estado = 1;	
			}
			//essa variavel temporária determina a velocidade que o player se move
			var _velo = vel * velDash;
			
			//determinando a direção que o personagem vai andar pelo angulo
			var _dir = point_direction(0, 0, (_right - _left), (_down - _up)); //esse calculo determina a direção baseado em 0, 1 e -1
		
			//velocidade + velocidade do dash na direção da variavel _dir
			var _movex = lengthdir_x(_velo, _dir);
			var _movey = lengthdir_y(_velo, _dir);
			
			//automaticamente colide com os objetos do vetor _objs
			move_and_collide(_movex, _movey, colisions);
		
		}else{
			estado = 0;	
		}
	}	
	
}

stateMachine = function(_estado, _estadoLado){

	switch(_estado){
	
		case(0):		//Idol
		
			switch(_estadoLado){
			
				case(0):	//Frente
					
					show_debug_message("idol frente");
					
				break;
				case(1):	//Direita
					
					show_debug_message("idol direita");
					
				break;
				case(2):	//Cima
					
					show_debug_message("idol cima");
					
				break;
				case(3):	//Esquerda
					
					show_debug_message("idol esquerda");
					
				break;
			
			}
		
		break;
		case(1):		//Andando
		
			switch(_estadoLado){
			
				case(0):	//Frente
					
					show_debug_message("andando frente");
					
				break;
				case(1):	//Direita
					
					show_debug_message("andando direita");
					
				break;
				case(2):	//Cima
					
					show_debug_message("andando cima");
					
				break;
				case(3):	//Esquerda
					
					show_debug_message("andando esquerda");
					
				break;
			
			}
		
		break;
		case(2):		//Dash
		
			switch(_estadoLado){
			
				case(0):	//Frente
					
					show_debug_message("dash frente");
					
				break;
				case(1):	//Direita
					
					show_debug_message("dash direita");
					
				break;
				case(2):	//Cima
					
					show_debug_message("dash cima");
					
				break;
				case(3):	//Esquerda
					
					show_debug_message("dash esquerda");
					
				break;
			
			}
		
		break;
		case(3):		//Poder
		
			switch(_estadoLado){
			
				case(0):	//Frente
					
					show_debug_message("poder frente");
					
				break;
				case(1):	//Direita
					
					show_debug_message("poder direita");
					
				break;
				case(2):	//Cima
					
					show_debug_message("poder cima");
					
				break;
				case(3):	//Esquerda
					
					show_debug_message("poder esquerda");
					
				break;
			
			}
		
		break;
	
	}
	
}
	
checaEmpurrao = function(){
	
	var _margem = 2;

	var _caixa = instance_nearest(x, y, IntBox_obj);
	
	if(place_meeting(x, y+_margem, _caixa)){
				if(_caixa.puxando){
					if(ragdollTimer == 0){
						ragdollTimer = ragdollTimerMax;	
					}
					canControl = 0;
					hspeed = _caixa.hspeed;
					vspeed = _caixa.vspeed;
				}
			}else{
				if(ragdollTimer >0){
				
					ragdollTimer--;
					hspeed = lerp(hspeed, 0, ragdoll);
					vspeed = lerp(vspeed, 0, ragdoll);
				
				}else{
					canControl = 1;
					hspeed = 0;
					vspeed = 0;	
				}
			}
		
}
	
#endregion	

