tamanho		= 64

cam			= view_camera[0];

colu		= ceil(camera_get_view_width(cam) / tamanho);

lin			= ceil(camera_get_view_height(cam) / tamanho);


imgIndex = 0;

imgNum  = sprite_get_number(TransicaoQuad_spr) - 1;

velAni = sprite_get_speed(TransicaoQuad_spr) / game_get_speed(gamespeed_fps);

entrando = 1;

