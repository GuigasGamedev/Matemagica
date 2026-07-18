depth = -y;

image_alpha -= alphaDecay;

speed = lerp(speed, 0, smoothSpeed);

if(image_alpha < 0 or !global.gamefeel){

	instance_destroy(id);
	
}