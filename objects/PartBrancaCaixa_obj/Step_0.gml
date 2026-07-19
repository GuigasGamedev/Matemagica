depth = -y;

luz.x = x;
luz.y = y;

luz.image_alpha = image_alpha - .7;
luz.image_xscale = 1.5;
luz.image_yscale = 1.5;

image_alpha -= alphaDecay;

direction += sin(delta_time/1000000) * ramDir;

speed = lerp(speed, 0, smoothSpeed);

if(image_alpha < 0 or !global.gamefeel){

	instance_destroy(luz);
	instance_destroy(id);
	
}