speed -= speedDecay;
image_alpha -= alphaDecay;

image_xscale += escalaUp;
image_yscale = image_xscale;

if(image_alpha <= 0){

	instance_destroy(id);
	
}