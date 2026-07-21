image_alpha -= alphaDecay;

if(image_alpha <= 0){

	instance_destroy(id);
	
}