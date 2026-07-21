direction = random_range(0, 180);
speed = random_range(30, 40);

image_xscale = random_range(1, 2);

ang = random_range(.3, .5);

gravity = 2;

image_alpha = 1;

alphaDecay = .03;

luz = instance_create_layer(x, y, "Particulas", LuzPart_obj);

luz.image_alpha = image_alpha - .1;
luz.image_xscale = image_xscale;
luz.image_yscale = image_xscale;