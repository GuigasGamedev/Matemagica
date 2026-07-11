// Inherit the parent event
event_inherited();

//degub
funcoesTexto(fontNumero_fnt,  c_yellow, fa_middle, fa_center);

if(!operador){
	draw_text(x+1, y+25, valor);
}else{

	switch(valor){
	
		case(0):
			draw_text(x+1, y+25, "+");
		break;
		
		case(1):
			draw_text(x+1, y+25, "-");
		break;
		
		case(2):
			draw_text(x+1, y+25, "X");
		break;
		
		case(3):
			draw_text(x+1, y+25, "%");
		break;
		
		default:
		break;
	
	}
		
}

zeraTexto();
