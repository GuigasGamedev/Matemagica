event_inherited();

ligandoParticulas = 1;
moveParticulas = 1;

hitbox = instance_create_layer(x, y, "HitBox", boxHitbox_obj);


criaPartMax = 40;
criaPartTime = 0;

#region metodos de sprites

//esse método é chamado no próprio create. Ele determinará a sprite inicial da caixa
spriteChange = function(){
	
	var _ramdomSprite = floor(random_range(1, 4.9));	//cria uma variavel temporária "_randomSprite" com um valor aleatorio entre 1 e 4.9
						//a função floor arredonda um número para baixo, portanto o menor valor retornado é 1 e o maior é 4

	//temos 3 tipos de caixa diferente e cada tipo de caixa tem 4 sprites diferentes
	//portanto, utilizei switch cases dentro de outros
	//o primeiro determina o tipo da caixa
	//dentro de cada case de tipoCaixa temos outro switch que determina qual sprite será utilizada tendo como base
	//o numero aleatório criado
	switch(tipo){
	
		case "pull":
		
			switch(_ramdomSprite){
				
				case 1:
					sprite_index = pullBox1_spr;
				break
				case 2:
					sprite_index = pullBox2_spr;
				break
				case 3:
					sprite_index = pullBox3_spr;
				break
				case 4:
					sprite_index = pullBox4_spr;
				break
				default:
					sprite_index = error_spr;
				break	
			}
			image_speed = 0;
			
		break;
		case "push":
		
			switch(_ramdomSprite){
				
				case 1:
					sprite_index = pushBox1_spr;
				break
				case 2:
					sprite_index = pushBox2_spr;
				break
				case 3:
					sprite_index = pushBox3_spr;
				break
				case 4:
					sprite_index = pushBox4_spr;
				break
				default:
					sprite_index = error_spr;
				break	
			}
			image_speed = 0;
			
		break;
		case "both":
		
			switch(_ramdomSprite){
				
				case 1:
					sprite_index = bothBox1_spr;
				break
				case 2:
					sprite_index = bothBox2_spr;
				break
				case 3:
					sprite_index = bothBox3_spr;
				break
				case 4:
					sprite_index = bothBox4_spr;
				break
				default:
					sprite_index = error_spr;
				break	
			}
			image_speed = 0;
			
		break;
		default:
			sprite_index = error_spr;				//em caso de algum erro, existe uma sprite de erro
	}
	
	//essa função é feita para deixar as caixas diferentes uma das outras
	//é uma função completamente opcional, mas acredito que o resultado é interessante
	
}

//esse método é a stateMachine da caixa. É atraves dela que é possível determinar qual sprite(index) será utilizada
//ela controla majoritariamente as animações da caixa
stateMachine = function(){
	
	//mudando o estado para desligando APENAS se a variavel apagando for true
	//e o estado for diferente de 5 (movendo)
	if(apagando = 1 && estado != 5){
		estado = 6;	
		image_index = 10; //declarando o index aqui para o step não executar ele varias vezes
	}
	
	//se highlight for true, o cooldown de animação começa a rolar
	if(highlight){
		if(animCd > 0){
			animCd--;	
		}else{
			animCd = animCdMax;	
		}
	}
	
	//switch case na variável estado para definir como a caixa está e como ele se comporta
	switch(estado){
		case 0: //parado
			image_speed = 0;
			image_index = 0;
		break;	
		case 1: //ligando
			if(global.gamefeel){
				if(ligandoParticulas){
			
					for(var _i = 0; _i < 20; _i++){
						criaParticulas(PartBrancaCaixa_obj, x, x, y, y);
					}
			
					ligandoParticulas = 0;
				}
				}
			image_speed = 1.3;
			if(image_index >= 7){
				estado = 2;	
			}
		break;
		case 2: //travando animação (talvez não precise dessa aqui)
			image_speed = 0;
			estado = 3;
		break;
		case 3: //subindo
			image_index = clamp(image_index, 7, 9); //limitando o valor entre 7 e 9
			if(animCd <= 0){
				image_index += 1;	
			}
			if(image_index >= 9){
				estado = 4;	
			}
		break;	
		case 4: //descendo
			image_index = clamp(image_index, 7, 9); //limitando o valor entre 7 e 9
			if(animCd <= 0){
				image_index -= 1;	
			}
			if(round(image_index) == 7){
				estado = 3;	//se não houver nenhuma interferencia externa como o zeroHigh(), ele fica
							//indo e voltando do case 3 e 4
			}
		break;
		case 5: //se movendo
			image_speed = 0;
			image_index = 13;
			
			var _xMin = x - (sprite_get_width(bothBox1_spr) / 2);
			var _xMax = x + (sprite_get_width(bothBox1_spr) / 2);
			var _ymin = (y + (sprite_get_height(bothBox1_spr)/2)) - 50;
			var _ymax = (y + (sprite_get_height(bothBox1_spr)/2));
			
			if(global.gamefeel){
			
				var _marg = 75;
	
				var _xMin = x - (sprite_get_width(bothBox1_spr)/2) - _marg;
				var _xMax = x + (sprite_get_width(bothBox1_spr)/2) + _marg;
				var _yMin = y - (sprite_get_height(bothBox1_spr)/2) - _marg;
				var _yMax = y + (sprite_get_height(bothBox1_spr)/2) + _marg;
	
				if(empurrando){
					criaParticulas(PartEmpurrada_obj, _xMin, _xMax, _yMin, _yMax);
				}else{
					criaParticulas(PartPuxada_obj, _xMin, _xMax, _yMin, _yMax);
				}
			
			}
			
			if(global.gamefeel){
				criaParticulas(poeiraCaixa_obj, _xMin, _xMax, _ymin, _ymax);
			}
			//este case sai do 5 pelo método de colisão com a limitHitBox_obj
		break;
		case 6: //desligando
			ligandoParticulas = 1;
			apagando = 0; //assim que ele entra nesse estado ele zera o apagando para o if la de cima rodar apenas 1 vez
			image_speed = .6;
			if(image_index >=12.6){
				estado = 0;	
			}
		break;
		default:
			estado = 0;
		break;	
	}
}

#endregion

#region Chamando métodos no create

//chamando o método para determinar a sprite da caixa assim que ela é criada
spriteChange();

#endregion