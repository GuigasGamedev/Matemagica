if(interCD > 0){
	interCD--;
}

if(interCD <= 0){
	interCD = 0;
}

if(canControlCD > 0){
	canControlCD--;
}

if(canControlCD <= 0 and estado == 3){
	canControl = 1;
	canControlCD = 0;
}

//chamando o metoddo geral aqui para ser executado toda hora
control();
depth = -y;