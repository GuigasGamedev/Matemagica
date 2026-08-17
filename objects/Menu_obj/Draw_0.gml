draw_sprite_ext(MenuFundo_spr, 0, x_fundo, y_fundo, 1.3, 1.3, 0, c_white, 1);			//desenhando o fundo do desenho

var _xOff1 = cos(floatTimer1 * 0.7) * 1.2;
var _yOff1 = sin(floatTimer1) * 4;
var _ang1 = sin(floatTimer1 * 0.8) * 2;

var _xOff2 = cos(floatTimer2 * 0.7) * 1.2;
var _yOff2 = sin(floatTimer2) * 4;
var _ang2 = sin(floatTimer2 * 0.8) * 2;

var _xOff3 = cos(floatTimer3 * 0.7) * 1.2;
var _yOff3 = sin(floatTimer3) * 4;
var _ang3 = sin(floatTimer3 * 0.8) * 2;

var _xOff4 = cos(floatTimer4 * 0.7) * 1.2;
var _yOff4 = sin(floatTimer4) * 4;
var _ang4 = sin(floatTimer4 * 0.8) * 2;

//operadores
draw_sprite_ext(MenuMais_spr, 0, x_frente + _xOff1, y_frente + _yOff1, 1.3, 1.3, _ang1, c_white, 1 );
draw_sprite_ext(MenuMenos_spr, 0, x_frente + _xOff2, y_frente + _yOff2, 1.3, 1.3, _ang2, c_white, 1 );
draw_sprite_ext(MenuMulti_spr, 0, x_frente + _xOff3, y_frente + _yOff3, 1.3, 1.3, _ang3, c_white, 1 );
draw_sprite_ext(MenuDiv_spr, 0, x_frente + _xOff4, y_frente + _yOff4, 1.3, 1.3, _ang4, c_white, 1 );
