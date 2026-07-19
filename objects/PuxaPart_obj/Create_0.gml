
speed = random_range(30, 40);

image_alpha = random_range(.6, 1);

luz = instance_create_layer(x, y, "Particulas", LuzPart_obj);
luz.image_blend = c_aqua;
luz.image_xscale = 1;
luz.image_yscale = 1;
luz.image_alpha = image_alpha - .9;

alphaDecay = random_range(.03, .06);

floatTimer = random(360);
ranDir = random_range(-10, 10);

sumindo = 0;

time = 4;