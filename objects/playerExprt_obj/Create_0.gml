
#region variáveis

vida = 1;				//vida (obvio)
velOriginal = 4;		//velocidade Original
vel = 4;				//velocidade
velDash = 1;			//velocidade do dash
velDashMax = 5;			//velocidade máxima do dash
dashCD = 0;				//cooldown do dash
dashCDMAX = 45;			//cooldown máxdo dash
dashDuration = 15;		//duração do dash
dashDurationTimer = 0;	//timer da duração do dash

estado = 0;				//estado para state machine
estadoLado = 0;			//estado de lado para state machina

visivel = 1;

canControl = 1;			//variavel para determinar se o jogador pode controlar o personagem
canControlCD = 0;		//cooldown de controle     (essa variável serve para travar o jogador por um pequeno momento após interagir com um obj)
canControlCDMAX = 15;	//cooldown max de controle

interCD = 0;			//variavel para determinar se o jogador pode interagir com os objetos
interCDMax = 60;		//tempo máx para o jogador interagir com algo novamente

//variaveis para desenho:
spriteID = idle_spr;
subimage = 0;
escalaX = 4;
escalaY = 4
escalaPadrao = 4;

colisions = [];

#endregion

//método geral
control = function(){
	
		movimento();		//chamando o método de movimento
		
		//lista de objetos que o jogador pode colidir dependo do estado do jogador
		colisions = [limitHitBox_obj];
	
		stateMachine(estado, estadoLado);
		
		if(global.tutoriais){
			detectaColisaoTutorial();
		}
		
}

#region métodos de interação

detectaColisaoTutorial = function(){

	if(instance_exists(tutorialArea_obj)){
	
		if(place_meeting(x, y, tutorialArea_obj)){
		
			global.colisaoTutorial = 1;
			global.estagioTutorial = instance_place(x, y, tutorialArea_obj).estagio;
		
		}else{
		
			global.colisaoTutorial = 0;
		
		}
		
	}
	
}

#endregion

#region metodos de movimentação ou animação

//método de movimentação do jogador
movimento = function(){	//recebe uma booleana para saber se o jogador pode andar	
	
	//se o jogador consegue controlar...
	if(canControl){	
		
			//detecta booleanas para teclas do teclado para setar os comandos
			var _up = keyboard_check(ord("W"));
			var _down = keyboard_check(ord("S"));
			var _left = keyboard_check(ord("A"));
			var _right = keyboard_check(ord("D"));
			var _dash = keyboard_check_pressed(vk_shift);
		
			if(_dash && dashCD == 0){	//se a tecla de dash for apertada e o cooldown do dash for 0...
	
				velDash = velDashMax;				//velocidade do dash recebe a velocidade de dash máxima
				dashCD = dashCDMAX;					//aumenta o cd do dash
				
					escalaY = .2;
					if(estadoLado != 3){
						escalaX = 6;
					}else{
						escalaX = -6;
					}

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
			}else if(estado != 4 and estado != 5 and estado != 6){
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
		
		}else if(estado != 4 and estado != 5 and estado != 6){
			estado = 0;	
		}
	}	
	
}

stateMachine = function(_estado, _estadoLado){

	//completar subimage com os index da sua sprite

	switch(_estado){
	
		case(0):		//Idol
		
		spriteID = idle_spr;
		escalaY = escalaPadrao;
		
			switch(_estadoLado){
			
				case(0):	//Frente
				
					escalaX = escalaPadrao;
					
					if(subimage >= 4){
						subimage = 0;	
					}
					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=0 and subimage<3){
								subimage++;
							}else{
								subimage = 0;
							}
							animTimer = 30;
						
						}
					
					}
					
				break;
				case(1):	//Direita
				
					escalaX = escalaPadrao;
					
					if(subimage <= 4 or subimage >= 8){
						subimage = 4;	
					}
					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=4 and subimage<7){
								subimage++;
							}else{
								subimage = 4;
							}
							animTimer = 30;
						
						}
					
					}
					
				break;
				case(2):	//Cima
				
					escalaX = escalaPadrao;
				
					if(subimage < 8){
						subimage = 8;	
					}

					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=8 and subimage<11){
								subimage++;
							}else{
								subimage = 8;
							}
							animTimer = 30;
						
						}
					
					}
					
				break;
				case(3):	//Esquerda
					
					escalaX = -escalaPadrao;
				
					if(subimage <= 4 or subimage >= 8){
						subimage = 4;	
					}
					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=4 and subimage<7){
								subimage++;
							}else{
								subimage = 4;
							}
							animTimer = 30;
						
						}
					
					}
					
				break;
			
			}
		
		break;
		case(1):		//Andando
		
			spriteID = correndo_spr;
			escalaY = escalaPadrao;
			
			if(animTimer > 15){
				animTimer = 0;	
			}
		
			switch(_estadoLado){
			
				case(0):	//Frente
				
					escalaX = escalaPadrao;
					
					if(subimage > 6){
						subimage = 0;	
					}
					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=0 and subimage<5){
								subimage++;
								
								if(global.gamefeel and(subimage == 1 or subimage == 4)){
									
									var _meia = sprite_get_height(correndo_spr)/2;
								
									criaParticulas(poeiraCaixa_obj, x, x, y + _meia, y + _meia);
								
								}
								
							}else{
								subimage = 0;
							}
							animTimer = 5;
						
						}
					
					}
					
				break;
				case(1):	//Direita
				
					escalaX = escalaPadrao;
					
					if(subimage < 6 or subimage > 12){
						subimage = 6;	
					}
					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=6 and subimage<11){
								subimage++;
								
								if(global.gamefeel and(subimage == 8 or subimage == 11)){
									
									var _meia = sprite_get_height(correndo_spr)/2;
								
									criaParticulas(poeiraCaixa_obj, x, x, y + _meia, y + _meia);
								
								}
								
							}else{
								subimage = 6;
							}
							animTimer = 5;
						
						}
					
					}
					
				break;
				case(2):	//Cima
				
					escalaX = escalaPadrao;
				
					if(subimage < 12){
						subimage = 12;	
					}

					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=12 and subimage<16){
								subimage++;
								
								if(global.gamefeel and(subimage == 13 or subimage == 16)){
									
									var _meia = sprite_get_height(correndo_spr)/2;
								
									criaParticulas(poeiraCaixa_obj, x, x, y + _meia, y + _meia);
								
								}
								
							}else{
								subimage = 12;
							}
							animTimer = 5;
						
						}
					
					}
					
				break;
				case(3):	//Esquerda
					
					escalaX = -escalaPadrao;
					
					if(subimage < 6 or subimage > 12){
						subimage = 6;	
					}
					
					if(animTimer >= 0){
					
						animTimer--;
						
						if(animTimer <= 0){
						
							if(subimage>=6 and subimage<11){
								subimage++;
								
								if(global.gamefeel and(subimage == 8 or subimage == 11)){
									
									var _meia = sprite_get_height(correndo_spr)/2;
								
									criaParticulas(poeiraCaixa_obj, x, x, y + _meia, y + _meia);
								
								}
								
							}else{
								subimage = 6;
							}
							animTimer = 5;
						
						}
					
					}
					
				break;
			
			}
		
		break;
		case(2):		//Dash
		
					spriteID = correndo_spr;
				
					if(escalaY < escalaPadrao - .1){
						escalaY = lerp(escalaY, escalaPadrao, .1);
					}else{
						escalaY = escalaPadrao;	
					}	
				
					if(estadoLado != 3){
						if(escalaX > escalaPadrao + .1){
							escalaX = lerp(escalaX, escalaPadrao, .1);
						}else{
							escalaX = escalaPadrao;	
						}	
					}else{
						if(escalaX < -escalaPadrao - .1){
						escalaX = lerp(escalaX, -escalaPadrao, .1);
						}else{
							escalaX = -escalaPadrao;	
						}
					}
				
					criaParticulas(poeiraCaixa_obj, x, x, y, y);
				
					var _part = choose(1, 2);
					if(_part == 1){
						criaParticulas(PartPuxada_obj, x, x, y, y);
					}else{
						criaParticulas(PartEmpurrada_obj, x, x, y, y);
					}
		
			switch(_estadoLado){
			
				case(0):	//Frente
					
					subimage = 0;
					
						var _sombra1 = instance_create_layer(x, y, "Particulas", DashPart_obj);
						_sombra1.subimg = 0;
						_sombra1.image_yscale = escalaY - .3;
						_sombra1.image_xscale = escalaX - .3;
					
				break;
				case(1):	//Direita
					
					subimage = 7;
					
						var _sombra2 = instance_create_layer(x, y, "Particulas", DashPart_obj);
						_sombra2.subimg = 1;
						_sombra2.image_yscale = escalaY - .3;
						_sombra2.image_xscale = escalaX - .3;
					
				break;
				case(2):	//Cima
					
					subimage = 15;
					
						var _sombra3 = instance_create_layer(x, y, "Particulas", DashPart_obj);
						_sombra3.subimg = 3;
						_sombra3.image_yscale = escalaY - .3;
						_sombra3.image_xscale = escalaX - .3;
					
				break;
				case(3):	//Esquerda
					
					subimage = 7;
					
						var _sombra4 = instance_create_layer(x, y, "Particulas", DashPart_obj);
						_sombra4.subimg = 1;
						_sombra4.image_yscale = escalaY - .3;
						_sombra4.image_xscale = escalaX - .3;
					
				break;
			
			}
		
		break;
		case(3):		//Poder
		
		break;
	}
	
}	
#endregion	

