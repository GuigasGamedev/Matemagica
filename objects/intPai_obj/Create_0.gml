
randomise(); //"randomiza" a seed de aleatoriedade

//regions servem para separar o código por regiões para organizar
#region variaveis 

//velocidade da caixa
vel = 15;		


//variáveis de controle
puxando = 0;	//variável de controle para verificar se a caixa esta sendo puxada
empurrando = 0;	//variável de controle para verificar se a caixa esta sendo empurrada
canMove = 1;	//variável de controle para verificar se a caixa pode se mexer
highlight = 0;	//variável de controle para verificar se a caixa é a selecionada pelo jogador
apagando = 0;	//variável de controle para verificar se a luz da caixa está se apagando

//variáveis para deteminar a direção
playerDir = 0; 
dir = 0;
intDir = 0;

//variável para determinar o estado da caixa na máquina de estados
estado = 0;

//variáveis de cooldown de animação da caixa;
animCd = 0;
animCdMax = 60;

//vetor para controlar as outras caixas da room
//futuramente ela será substituida para receber todos os objetos da room;
box = [];

//modifica o vetor box para cada valor ser um id de alguma caixa na room
//talvez esse método funcione com esse for fora do objeto caixa
for (var i = 0; i < instance_number(IntBox_obj); ++i){
	box[i] = instance_find(IntBox_obj,i);
}

//existe mais uma variável que não está aqui, mas foi criada na raiz do objeto
//ela se chama "tipoCaixa" e determina de qual tipo é a caixa em questão
//criando ela fora do código facilita a criação de levels já que ela pode ser 
//alterada na própria room ao invez de código

#endregion

#region metodos

//Esse metodo para o obj :)
parandoObj = function(_object){ 

	if(hspeed > 0){
		hspeed = 0;
		while(place_meeting(x, y, _object)){
				x -= 1;
		}
	}
	
	if(hspeed < 0){
		hspeed = 0;
		while(place_meeting(x, y, _object)){
				x += 1;
		}
	}
	
	if(vspeed < 0){
		vspeed = 0;
		while(place_meeting(x, y, _object)){
				y += 1;
		}
	}
	
	if(vspeed > 0){
		vspeed = 0;
		while(place_meeting(x, y, _object)){
				y -= 1;
		}
	}
	
	puxando = 0;
	empurrando = 0;
	canMove = 1;
}
	
//esse método serve para que nenhuma outra caixa tenha o highligh
//ele é o responsável pela seleção de caixas pelo jogador
//futuramente ela também fará isso com outros objetos interativos
zeroHigh = function(){
		
		//utilizando o vetor para alterar cada instancia da room menos a instancia em que o metodo foi chamado
		for (var i = 0; i < instance_number(intPai_obj); ++i){
			if(box[i] != id){
				if(box[i].highlight = 1){ //pega a caixa que esta ativa no momento e seta o apagando dela para 1 para ativar a animação de apagar
					box[i].apagando = 1;	
				}
				variable_instance_set(box[i], "highlight", 0); //seta todos os highligts das caixas para 0;
			}	
		}
}	

//esse método serve para variar a direção em que o objeto será empurrado
variandoDir = function(){
	
		if(instance_exists(player_obj)){ //confere a existencia do player (só por cuidado)
			playerDir = point_direction(x, y, player_obj.x, player_obj.y); //playerDir recebe a direção do jogador em angulo
		}
	
		//de acordo com o cauculo de angulo do gamemaker, o dir recebe um valor arredondado equivalente a direção do player
		if(playerDir < 45 || playerDir > 315){
			dir = 1;	//direita
		}else
		if(playerDir > 45 && playerDir < 135){
			dir = 2;    //cima
		}else
		if(playerDir > 135 && playerDir < 230){
			dir = 3;    //esquerda
		}else
		if(playerDir > 230 && playerDir < 315){
			dir = 4;    //baixo
		}
}

//esse método serve para puxar um objeto
puxandoMet = function(){
	

	//seta o estado para 5 (movendo) e puxando para true
	estado = 5;
	puxando = 1;
	
	//se a caixa puder se mover, ela move
	//isso evita com que uma caixa que já esteja se movendo de mover novamente
	if(canMove){
		intDir = dir;	//intDir recebe dir para que mesmo que o jogador mude de lugar
						//a caixa continue indo na mesma direção
		switch(intDir){ //de acordo com a direção, a caixa se move
			case 1:
				hspeed = vel;
				break;
			case 2:
				vspeed = -vel;
				break;
			case 3:
				hspeed = -vel;
				break;
			case 4:
				vspeed = vel;
				break;
		}
		canMove = 0; //enquanto ela está se movendo, ela não pode se mover novamente
	}
}

//esse método serve para empurrar um objeto
empurrandoMet = function(){
	
	//seta o estado para 5 (movendo) e empurrando para true
	estado = 5;
	empurrando = 1;

	//se a caixa puder se mover, ela move
	//isso evita com que uma caixa que já esteja se movendo de mover novamente
	if(canMove){
		intDir = dir;	//intDir recebe dir para que mesmo que o jogador mude de lugar
						//a caixa continue indo na mesma direção
		switch(intDir){ //de acordo com a direção, a caixa se move
			case 1:
				hspeed = -vel;
				break;
			case 2:
				vspeed = vel;
				break;
			case 3:
				hspeed = vel;
				break;
			case 4:
				vspeed = -vel;
				break;
		}
		canMove = 0; //enquanto ela está se movendo, ela não pode se mover novamente
	}
}

#endregion