floatTimer += 0.08;

time--;

luz.x = x;
luz.y = y;
luz.image_alpha = image_alpha - .9;

if(time <= 0){
	sumindo = 1;	
}

show_debug_message(sumindo);

if(sumindo){

	image_alpha -= alphaDecay;
	direction += sin(floatTimer) * ranDir;
	speed = lerp(speed, 0, .06);
	
}

if(image_alpha <= 0){
	instance_destroy(luz);
	instance_destroy(id);	
}

//sin(floatTimer) * 4;