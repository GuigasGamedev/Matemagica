if(entrando){
	imgIndex += velAni;

	if(imgIndex - imgNum > lin + 1){

		if(room_exists(global.roomDest)){
	
			room_goto(global.roomDest);	
			entrando = 0;
	
		}
	
	}
}else{

	imgIndex -= velAni;
	
	if(imgIndex < 5){
	
		instance_destroy();
	
	}
	
}