scale = random_range(.4, .7);

image_yscale = scale;
image_xscale = scale;

luz = instance_create_layer(x, y, "Particulas", LuzPart_obj);
luz.image_blend = c_purple;
luz.image_xscale = 1.5;
luz.image_yscale = 1.5;

subindo = 1;

alphaDecay = .005;

alphaMax = random_range(.5, .9);

image_alpha = .1;

ramX = random_range(-20, 20);
ramY = random_range(-20, 20);
