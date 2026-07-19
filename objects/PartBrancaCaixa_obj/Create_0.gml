scale = random_range(.6, .8);

luz = instance_create_layer(x, y, "Particulas", LuzPart_obj);

image_yscale = scale;
image_xscale = scale;

direction = random(349);

speed = random_range(5, 30);

smoothSpeed = .1;

alphaDecay = random_range(.03, .06);

image_alpha = 1;

ramDir = random_range(-50, 50);