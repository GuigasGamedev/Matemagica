image_alpha -= alphaDecay;
image_angle += ang;

luz.image_alpha = image_alpha - .1;
luz.x = x;
luz.y = y;

if(image_alpha <= 0){

	instance_destroy(luz);
	instance_destroy(id);
	
}