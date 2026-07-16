tpTimerMax = 60;
tpTimer = tpTimerMax;
chegou = 0;

realizaTipo = function(){

	if(global.entreSalas != noone){
	
		if(global.entreSalas.chegada){
			if(global.salaTrocando){
			
				//show_debug_message("teste");
				if(instance_exists(player_obj)){
				
					player_obj.estado = 5;
					player_obj.canControl = 0;
					player_obj.vel = player_obj.velTrans;
					player_obj.estadoLado = 2;
					player_obj.vspeed = -player_obj.vel;	
					
					if(chegou){
						tpTimer = tpTimerMax;
						chegou = 0;
					}
					
					tpTimer--;
					
					if(tpTimer<=0){
					
						player_obj.estado = 0;
						player_obj.canControl = 1;
						player_obj.vel = player_obj.velOriginal;
						player_obj.estadoLado = 2;
						player_obj.vspeed = 0;	
						
						global.salaTrocando = 0;
						instance_destroy(id);
					
					}
					
				
				}
			}
		}else{
		
			tpTimer--;
			
			if(tpTimer <= 0){
			
				if(!chegou){
					room_goto(global.roomDest)
					global.entreSalas = noone;
					chegou = 1;
				}
			}
		
		}
	
	}
	
}