direction = random(349);

luz = instance_create_layer(x, y, "Particulas", LuzPart_obj);
luz.image_blend = c_red;
luz.image_xscale = 1.2;
luz.image_yscale = 1.2;

scale = random_range(.7, 1.3);

image_yscale = scale;
image_xscale = scale;

speed = random_range(5, 10);

smoothSpeed = .03;

alphaDecay = random_range(.01, .03);

image_alpha = 1;

ramDir = random_range(-50, 50);