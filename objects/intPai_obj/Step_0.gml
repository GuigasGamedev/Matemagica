//se o objeto for o selecionado, ela terá a direção variando
if(highlight){
	variandoDir();
	if(estado == 0){	//se o objeto for o selecionado e o estado for 0
		//seta o estado para 1 (ligando)
		estado = 1;	
	}
}

if(puxando){
	puxandoMet();
	var _tempo = 1;
	screenshake(_tempo, magnitude, ssDecrease);
}
if(empurrando){
	empurrandoMet();
	var _tempo = 1;
	screenshake(_tempo, magnitude, ssDecrease);
}

x = abs(x);
y = abs(y);
