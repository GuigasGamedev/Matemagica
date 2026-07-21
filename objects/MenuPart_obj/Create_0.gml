scale = random_range(.4, .7);

image_yscale = scale;
image_xscale = scale;

cor = irandom_range(0, 3);
luzCor = 0;

switch(cor){

	case(0):
	
		image_index = 0;
		luzCor = c_aqua;
		
	break;
	case(1):
	
		image_index = 1;
		luzCor = c_orange;
	
	break;
	case(2):
	
		image_index = 2;
		luzCor = c_red;
		
	break;
	case(3):
	
		image_index = 3;
		luzCor = c_lime;
		
	break;
	
}

luz = instance_create_layer(x, y, "Particulas", LuzPart_obj);
luz.image_blend = luzCor;
luz.image_xscale = 1.5;
luz.image_yscale = 1.5;

subindo = 1;

alphaDecay = .005;

alphaMax = random_range(.5, .9);

image_alpha = .1;

ramX = random_range(-20, 20);
ramY = random_range(-20, 20);
