calcularExpressoes();

if(global.gamefeel){
	if(partTimer <= 0){

		for(var _i = 0; _i < 50; _i++){
			criaParticulas(PartAmbiente_obj, 0, room_width, 0, room_height);
		}
	
		partTimer = partTimerMax;
	
	}

	partTimer--;
}