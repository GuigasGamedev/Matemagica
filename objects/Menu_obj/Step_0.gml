ControleCamera();	//chamando o metodo de mover a camera

if(movendo or menuPrincipal){	//inicia o paralax assim que a camera começa a se mover
	controleParalax();
}

floatTimer1 += 0.08;
floatTimer2 += 0.08;
floatTimer3 += 0.08;
floatTimer4 += 0.08;

alfaAumentando(0.2);
alfaDiminuindo(0.5);

alfaTituloDiminuindo(0.06);
