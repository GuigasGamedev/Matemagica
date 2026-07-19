// Inherit the parent event
event_inherited();

var _xOff = cos(floatTimer * 0.7) * 1.5;
var _yOff = sin(floatTimer) * 4;
var _ang = sin(floatTimer * 0.8) * 5;
var _scale = 1.6 + sin(floatTimer * 1.3) * 0.02;

//degub

if(!operador){
		draw_set_font(fontNumero_fnt);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		// Sombra
		draw_set_color(c_black);
		draw_text_transformed(
		    x + 2 + _xOff,
		    y + 27 + _yOff,
		    string(valor),
		    _scale,
		    _scale,
		    _ang
		);

		// Texto principal
		draw_set_color(c_yellow);
		draw_text_transformed(
		    x + 1 + _xOff,
		    y + 25 + _yOff,
		    string(valor),
		    _scale,
		    _scale,
		    _ang
		);
		
		zeraTexto();
}else{
	
		draw_set_font(fontNumero_fnt);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

	switch(valor){
	
		case(0):
			draw_set_color(c_black);
			draw_text_transformed(
			    x + 2 + _xOff,
			    y + 27 + _yOff,
			    "+",
			    _scale,
			    _scale,
			    _ang
			);

			// Texto principal
			draw_set_color(c_lime);
			draw_text_transformed(
			    x + 1 + _xOff,
			    y + 25 + _yOff,
			    "+",
			    _scale,
			    _scale,
			    _ang
			);
		break;
		
		case(1):
			draw_set_color(c_black);
			draw_text_transformed(
			    x + 2 + _xOff,
			    y + 27 + _yOff,
			    "-",
			    _scale,
			    _scale,
			    _ang
			);

			// Texto principal
			draw_set_color(c_red);
			draw_text_transformed(
			    x + 1 + _xOff,
			    y + 25 + _yOff,
			    "-",
			    _scale,
			    _scale,
			    _ang
			);
		break;
		
		case(2):
			draw_set_color(c_black);
			draw_text_transformed(
			    x + 2 + _xOff,
			    y + 27 + _yOff,
			    "X",
			    _scale,
			    _scale,
			    _ang
			);

			// Texto principal
			draw_set_color(c_aqua);
			draw_text_transformed(
			    x + 1 + _xOff,
			    y + 25 + _yOff,
			    "X",
			    _scale,
			    _scale,
			    _ang
			);
		break;
		
		case(3):
			draw_set_color(c_black);
			draw_text_transformed(
			    x + 2 + _xOff,
			    y + 27 + _yOff,
			    "%",
			    _scale,
			    _scale,
			    _ang
			);

			// Texto principal
			draw_set_color(c_orange);
			draw_text_transformed(
			    x + 1 + _xOff,
			    y + 25 + _yOff,
			    "%",
			    _scale,
			    _scale,
			    _ang
			);
		break;
		
		default:
		break;
	
	}
		
	zeraTexto();
		
}

zeraTexto();
