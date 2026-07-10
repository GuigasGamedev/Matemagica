#region Slide

#region Variaveis gerais
cam					= view_camera[0];								//Salvando a camera numa variavel

cam_x				= 0;											//coordenada x que será usada na camera
cam_y				= 0;											//coordenada y que será usada na camera

target_y			= room_height - camera_get_view_height(cam);	//coordenada final da camera

vel					= 4;											//velocidade da transicao

movendo				= 0;											//variavel de controle para verificar se esta movendo

//variaveis de controle da alfa dos texto de opcoes
aparecendoMenu		= 0;
desaparecendoMenu	= 0;
alfaMenu			= 0;
desaparecendoTitulo = 0;
alfaTitulo			= 1;

if(!global.AbrindoJogo){
	menuPrincipal	= 1;									//variavel de controle para verificar se a camera esta embaixo
	cam_y			= target_y;
	alfaMenu		= 0;
	aparecendoMenu	= 1;
	alfaTitulo		= 0;
}else{
	menuPrincipal	= 0;	
}

if(global.AbrindoJogo){
	tela_de_titulo	= 1;										//variavel de controle para verificar se a camera esta embaixo
}else{
	tela_de_titulo	= 0;	
}

esperando			= 0;											//variavel de controle para verificar se esta esperando o timer

delay				= game_get_speed(gamespeed_fps) * 1;			//Delay da transicao 60 seg * quantos seg eu quero
timer				= 0;											//timer para receber o delay
#endregion	

#region Metodo
ControleCamera = function(){						//metodo para verificar e descer a camera

	if (!movendo and !menuPrincipal and !esperando){//verificando condicoes para descer a camera
		
	   if (keyboard_check_pressed(vk_anykey) or mouse_check_button(mb_any)){		//se for apertado qualquer botao...
			
			esperando = 1;							//entra no modo de espera do delay
			timer = delay;							//timer recebe o seu valor
			desaparecendoTitulo = 1;
			global.AbrindoJogo = 0;
			
	   }
		
	}

	if(esperando){									//quando entra no modo de espera do delay...
		
		timer--										//timer vai diminuindo (por step já que será chamado la)
		
		if(timer <= 0){								//quando timer chegar a 0...
		
			esperando = 0;							//sai do modo de espera
			movendo = 1;							//entra no modo movendo
		
		}
		
	}

	if (movendo){									//entrando no modo movendo...
		
	    cam_y = lerp(cam_y, target_y, 0.06);		//y lentamente se aproxima do objetivo
		
		if (abs(cam_y - target_y) < 4){
			aparecendoMenu = 1;						//faz aparecer as opçoes
			menuPrincipal = 1;						//seta o menu principal para 1
		}

	    if (abs(cam_y - target_y) < 1){				//se a diferenca for de menos de 1 pixel...
				
	        cam_y = target_y;						//posicao vai direto para o objetivo
	        movendo = 0;							//sai do modo movendo
			
	    }
		
	}

	camera_set_view_pos(cam, cam_x, cam_y);			//movimentando a camera
	
}
#endregion	
	
#endregion	

#region Paralax

#region Variaveis do Paralax

//armazenando as coordenadas originais das imagens
x_original		= room_width/2;						
y_original		= room_height - (room_height/4);		

//deixando as variaveis iguais as originais (até o metodo ser utilizado)
x_fundo			= x_original;						
y_fundo			= y_original;

x_frente		= x_original;
y_frente		= y_original;

#endregion

#region Metodo Paralax

controleParalax = function(){

	//Armazenando coordenadas do mouse em variaveis temporárias
	var _Xmouse = mouse_x;
	var _Ymouse = mouse_y;
	
	//Criando variaveis para armazenar a distancia do ponto original
	var _distX;
	var _distY;
	
	//Essa variavel serve para deifinir o maximo do movimento de cada camada (fundo nesse caso)
	var _divXMAXFun = 16;
	var _divYMAXFun = 10;
	
	//Essa variavel serve para deifinir o maximo do movimento de cada camada (frente nesse caso)
	var _divXMAXFre = 12;
	var _divYMAXFre = 8;
	
	//velocidade do lerp para suavizar a transicao
	var _velFundo = 0.05;
	var _velFrente = 0.05;


	//essas condicionais servem para verificar a distancia das coordenadas
	//do mouse com o ponto original
	if(mouse_y >= y_original){
		_distY = _Ymouse - y_original;	
	}else{
		_distY = -(y_original - _Ymouse);	
	}

	if(mouse_x >= x_original){
		_distX = _Xmouse - x_original;
	}else{
		_distX = -(x_original - _Xmouse);	
	}
	
	
	//X e Y que serao somados ao ponto original do fundo
	var _divXfun = _distX / _divXMAXFun;
	var _divYfun = _distY / _divYMAXFun;
	
	//X e Y que serao somados ao ponto original da frente
	var _divXfre = _distX / _divXMAXFre;
	var _divYfre = _distY / _divYMAXFre;
	
	//ponto final em que a imagem (do fundo) será desenhada
	var _x_fundoP = x_original + _divXfun;
	var _y_fundoP = y_original + _divYfun;
	
	//ponto final em que a imagem (da frente) será desenhada
	var _x_frenteP = x_original + _divXfre;
	var _y_frenteP = y_original + _divYfre;
	
	//Utilizando lerp para fazer o movimento mais suave
	x_fundo = lerp(x_fundo, _x_fundoP, _velFundo);
	y_fundo = lerp(y_fundo, _y_fundoP, _velFundo);
	
	x_frente = lerp(x_frente, _x_frenteP, _velFrente);
	y_frente = lerp(y_frente, _y_frenteP, _velFrente);
	
}

#endregion

#endregion

#region Opcoes

#region Variaveis

//Array de opcoes e index de escolha
opcoes				= ["Novo Jogo", "Continuar", "Opções", "Sair"];
index				= 0;

//numero de opcoes
n_opcoes			= array_length(opcoes);

//esfeito stretch das opções
xStretch = 0;
yStretch = 0;

#endregion

#region Metodos

//metodo para alterar a alfa das opcoes
alfaAumentando = function(_vel){

	//caso seja para aparecer
	if(aparecendoMenu){
		//alfa recebe o lerp para ficar suave usando o _vel como velocidade de transicao
		alfaMenu = lerp(alfaMenu, 1, _vel);
		//limite máximo do lerp
		if(alfaMenu > 0.9){
			//lerp para e sai da função
			alfaMenu = 1;
			aparecendoMenu = 0;
			
		}
	
	}
	
}

alfaDiminuindo = function(_vel){

	//caso seja para aparecer
	if(desaparecendoMenu){
		//alfa recebe o lerp para ficar suave usando o _vel como velocidade de transicao
		alfaMenu = lerp(alfaMenu, 0, _vel);
		//limite máximo do lerp
		if(alfaMenu < 0.1){
			//lerp para e sai da função
			alfaMenu = 0;
			desaparecendoMenu = 0;
			
		}
	
	}
	
}

alfaTituloDiminuindo = function(_vel){

	//caso seja para aparecer
	if(desaparecendoTitulo){
		//alfa recebe o lerp para ficar suave usando o _vel como velocidade de transicao
		alfaTitulo = lerp(alfaTitulo, 0, _vel);
		//limite máximo do lerp
		if(alfaTitulo < 0.1){
			//lerp para e sai da função
			alfaTitulo = 0;
			desaparecendoTitulo = 0;
			
		}
	
	}
	
}
#endregion

#endregion