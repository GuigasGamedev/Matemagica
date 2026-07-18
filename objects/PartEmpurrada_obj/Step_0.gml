depth = -y;

image_alpha -= alphaDecay;

direction += sin(delta_time/1000000) * ramDir;

speed = lerp(speed, 0, smoothSpeed);

if(image_alpha < 0 or !global.gamefeel){

	instance_destroy(id);
	
}