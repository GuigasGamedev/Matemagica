depth = -y;

x += sin(delta_time/1000000) * ramX;
y += sin(delta_time/1000000) * ramY;

luz.x = x;
luz.y = y;
luz.image_alpha = image_alpha - .7;

if(image_alpha < 0 or !global.gamefeel){
	instance_destroy(luz);
	instance_destroy(id);
}

if(image_alpha < alphaMax and subindo){
	image_alpha += alphaDecay;
	
	if(image_alpha >= alphaMax){
		subindo = 0;
	}
}

if(!subindo){
	image_alpha -= alphaDecay;
}

