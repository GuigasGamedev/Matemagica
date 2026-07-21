draw_sprite_ext(portao_spr, subimage, x, y, 1, 1, 0, c_white, 1);

var _xOff = cos(floatTimer * 0.7) * 1.5;
var _yOff = sin(floatTimer) * 4;
var _ang = sin(floatTimer * 0.8) * 5;
var _scale = 1.6;

draw_set_font(fontNumero_fnt);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(c_gray);
draw_text_transformed( x + 2 + _xOff, y + 2 + _yOff, objetivo, _scale, _scale, _ang);

draw_set_colour(c_yellow);
draw_text_transformed(x + _xOff, y + _yOff, objetivo, _scale, _scale, _ang);

zeraTexto();

if(abrindo){
	draw_sprite_ext(portao_spr, 2, x, y, 1, 1, 0, c_white, alphaBranco);
}