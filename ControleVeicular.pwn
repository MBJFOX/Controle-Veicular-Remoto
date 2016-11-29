#include <a_samp>//Samp Team
#include <zcmd>//Zeex

/*
	Versão atual 0.5b
	Foram testados 15 carros onde todos estão funcionando corretamente mas se for enquantrado algum carro que não funcione
		ou algum bug qualquer no FS por favor me mande MP no fórum.
	O FS foi feito para escolher qual o carro irá ser controlado no comando mas caso queira pode alterar para funcionar
		de acordo com seu GM desde que mantenha os creditos(não vai morrer se deixar né?)
*/

#define 	DIALOG_CONTROL 						1
#define 	DIALOG_CONTROL_TWODOORS_DOOR 		2
#define 	DIALOG_CONTROL_FOURDOORS_DOOR 		3
#define 	DIALOG_CONTROL_TWODOORS_WINDOW 		4
#define 	DIALOG_CONTROL_FOURDOORS_WINDOW 	5

new ControllingVvehicle[MAX_PLAYERS], string[320];
new Windows[MAX_VEHICLES][4], Doors[MAX_VEHICLES][4], Hood[MAX_VEHICLES], Trunk[MAX_VEHICLES], Engine[MAX_VEHICLES], Lights[MAX_VEHICLES];
new alarm, doors, objective;

public OnFilterScriptInit()
{
	print("|________________________________________________|");
	print(" 		Controle Remoto Veicular by MBJ 		 ");
	print("|________________________________________________|");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]) {
	switch(dialogid) {
		case DIALOG_CONTROL: {
			if(response) {
				switch(listitem) {
					case 0: {
						GetVehicleParamsCarDoors(ControllingVvehicle[playerid], Doors[ControllingVvehicle[playerid]][0], Doors[ControllingVvehicle[playerid]][1], Doors[ControllingVvehicle[playerid]][2], Doors[ControllingVvehicle[playerid]][3]);
						if(GetVehicleModel(ControllingVvehicle[playerid]) == 400 || GetVehicleModel(ControllingVvehicle[playerid]) == 401 || GetVehicleModel(ControllingVvehicle[playerid]) == 404 || GetVehicleModel(ControllingVvehicle[playerid]) == 405 || GetVehicleModel(ControllingVvehicle[playerid]) == 409 || GetVehicleModel(ControllingVvehicle[playerid]) == 418 || GetVehicleModel(ControllingVvehicle[playerid]) == 420 || GetVehicleModel(ControllingVvehicle[playerid]) == 421 || GetVehicleModel(ControllingVvehicle[playerid]) == 426 || 
						GetVehicleModel(ControllingVvehicle[playerid]) == 442 || GetVehicleModel(ControllingVvehicle[playerid]) == 445 || GetVehicleModel(ControllingVvehicle[playerid]) == 458 || GetVehicleModel(ControllingVvehicle[playerid]) == 466 || GetVehicleModel(ControllingVvehicle[playerid]) == 470 || GetVehicleModel(ControllingVvehicle[playerid]) == 479 || GetVehicleModel(ControllingVvehicle[playerid]) == 490 || GetVehicleModel(ControllingVvehicle[playerid]) == 507 || GetVehicleModel(ControllingVvehicle[playerid]) == 516 || 
						GetVehicleModel(ControllingVvehicle[playerid]) == 529 || GetVehicleModel(ControllingVvehicle[playerid]) == 540 || GetVehicleModel(ControllingVvehicle[playerid]) == 547 || GetVehicleModel(ControllingVvehicle[playerid]) == 547 || GetVehicleModel(ControllingVvehicle[playerid]) == 551 || GetVehicleModel(ControllingVvehicle[playerid]) == 560 || GetVehicleModel(ControllingVvehicle[playerid]) == 561 || GetVehicleModel(ControllingVvehicle[playerid]) == 579 || GetVehicleModel(ControllingVvehicle[playerid]) == 580 || 
						GetVehicleModel(ControllingVvehicle[playerid]) == 585 || GetVehicleModel(ControllingVvehicle[playerid]) == 596 || GetVehicleModel(ControllingVvehicle[playerid]) == 597 || GetVehicleModel(ControllingVvehicle[playerid]) == 598) {
							format(string, sizeof(string), "Porta Dianteira Motorista\t%s\nPorta Diateira Passageiro\t%s\nPorta Traseira Motorista\t%s\nPorta Traseira Passageiro\t%s\n",
								Doors[ControllingVvehicle[playerid]][0] == 1 ? "{00FF00}Aberta" : "{FF0000}Fechada",
								Doors[ControllingVvehicle[playerid]][1] == 1 ? "{00FF00}Aberta" : "{FF0000}Fechada",
								Doors[ControllingVvehicle[playerid]][2] == 1 ? "{00FF00}Aberta" : "{FF0000}Fechada",
								Doors[ControllingVvehicle[playerid]][3] == 1 ? "{00FF00}Aberta" : "{FF0000}Fechada");
							ShowPlayerDialog(playerid, DIALOG_CONTROL_FOURDOORS_DOOR, DIALOG_STYLE_TABLIST, "Controle Veicular", string, "Selecionar", "Sair");
						} else {
							format(string, sizeof(string), "Porta Motorista\t%s\nPorta Passageiro\t%s\n",
								Doors[ControllingVvehicle[playerid]][0] == 1 ? "{00FF00}Aberta" : "{FF0000}Fechada",
								Doors[ControllingVvehicle[playerid]][1] == 1 ? "{00FF00}Aberta" : "{FF0000}Fechada");
							ShowPlayerDialog(playerid, DIALOG_CONTROL_TWODOORS_DOOR, DIALOG_STYLE_TABLIST, "Controle Veicular", string, "Selecionar", "Sair");
						}
					}
					case 1: {
						GetVehicleParamsCarWindows(ControllingVvehicle[playerid], Windows[ControllingVvehicle[playerid]][0], Windows[ControllingVvehicle[playerid]][1], Windows[ControllingVvehicle[playerid]][2], Windows[ControllingVvehicle[playerid]][3]);
						if(GetVehicleModel(ControllingVvehicle[playerid]) == 400 || GetVehicleModel(ControllingVvehicle[playerid]) == 401 || GetVehicleModel(ControllingVvehicle[playerid]) == 404 || GetVehicleModel(ControllingVvehicle[playerid]) == 405 || GetVehicleModel(ControllingVvehicle[playerid]) == 409 || GetVehicleModel(ControllingVvehicle[playerid]) == 418 || GetVehicleModel(ControllingVvehicle[playerid]) == 420 || GetVehicleModel(ControllingVvehicle[playerid]) == 421 || GetVehicleModel(ControllingVvehicle[playerid]) == 426 || 
						GetVehicleModel(ControllingVvehicle[playerid]) == 442 || GetVehicleModel(ControllingVvehicle[playerid]) == 445 || GetVehicleModel(ControllingVvehicle[playerid]) == 458 || GetVehicleModel(ControllingVvehicle[playerid]) == 466 || GetVehicleModel(ControllingVvehicle[playerid]) == 470 || GetVehicleModel(ControllingVvehicle[playerid]) == 479 || GetVehicleModel(ControllingVvehicle[playerid]) == 490 || GetVehicleModel(ControllingVvehicle[playerid]) == 507 || GetVehicleModel(ControllingVvehicle[playerid]) == 516 || 
						GetVehicleModel(ControllingVvehicle[playerid]) == 529 || GetVehicleModel(ControllingVvehicle[playerid]) == 540 || GetVehicleModel(ControllingVvehicle[playerid]) == 547 || GetVehicleModel(ControllingVvehicle[playerid]) == 547 || GetVehicleModel(ControllingVvehicle[playerid]) == 551 || GetVehicleModel(ControllingVvehicle[playerid]) == 560 || GetVehicleModel(ControllingVvehicle[playerid]) == 561 || GetVehicleModel(ControllingVvehicle[playerid]) == 579 || GetVehicleModel(ControllingVvehicle[playerid]) == 580 || 
						GetVehicleModel(ControllingVvehicle[playerid]) == 585 || GetVehicleModel(ControllingVvehicle[playerid]) == 596 || GetVehicleModel(ControllingVvehicle[playerid]) == 597 || GetVehicleModel(ControllingVvehicle[playerid]) == 598) {
							format(string, sizeof(string), "Vidro Dianteiro Motorista\t%s\nVidro Diateiro Passageiro\t%s\nVidro Traseiro Motorista\t%s\nVidro Traseiro Passageiro\t%s\n",
								Windows[ControllingVvehicle[playerid]][0] == 0 ? "{00FF00}Aberto" : "{FF0000}Fechado",
								Windows[ControllingVvehicle[playerid]][1] == 0 ? "{00FF00}Aberto" : "{FF0000}Fechada",
								Windows[ControllingVvehicle[playerid]][2] == 0 ? "{00FF00}Aberto" : "{FF0000}Fechada",
								Windows[ControllingVvehicle[playerid]][3] == 0 ? "{00FF00}Aberto" : "{FF0000}Fechada");
							ShowPlayerDialog(playerid, DIALOG_CONTROL_FOURDOORS_WINDOW, DIALOG_STYLE_TABLIST, "Controle Veicular", string, "Selecionar", "Sair");
						} else {
							format(string, sizeof(string), "Vidro Motorista\t%s\nVidro Passageiro\t%s\n",
								Windows[ControllingVvehicle[playerid]][0] == 0 ? "{00FF00}Aberto" : "{FF0000}Fechado",
								Windows[ControllingVvehicle[playerid]][1] == 0 ? "{00FF00}Aberto" : "{FF0000}Fechada");
							ShowPlayerDialog(playerid, DIALOG_CONTROL_TWODOORS_WINDOW, DIALOG_STYLE_TABLIST, "Controle Veicular", string, "Selecionar", "Sair");							
						}
					}
					case 2: {
						SetVehicleParamsEx(ControllingVvehicle[playerid], Engine[ControllingVvehicle[playerid]], Lights[ControllingVvehicle[playerid]], alarm, doors, !Hood[ControllingVvehicle[playerid]], Trunk[ControllingVvehicle[playerid]], objective);
						return true;
					}
					case 3: {
						SetVehicleParamsEx(ControllingVvehicle[playerid], Engine[ControllingVvehicle[playerid]], Lights[ControllingVvehicle[playerid]], alarm, doors, Hood[ControllingVvehicle[playerid]], !Trunk[ControllingVvehicle[playerid]], objective);
						return true;
					}
					case 4: {
						SetVehicleParamsEx(ControllingVvehicle[playerid], !Engine[ControllingVvehicle[playerid]], Lights[ControllingVvehicle[playerid]], alarm, doors, Hood[ControllingVvehicle[playerid]], Trunk[ControllingVvehicle[playerid]], objective);
						return true;
					}
					case 5: {
						SetVehicleParamsEx(ControllingVvehicle[playerid], Engine[ControllingVvehicle[playerid]], !Lights[ControllingVvehicle[playerid]], alarm, doors, Hood[ControllingVvehicle[playerid]], Trunk[ControllingVvehicle[playerid]], objective);
						return true;
					}
				}
			}
		}
		case DIALOG_CONTROL_TWODOORS_DOOR: {
			if(response) {
				switch (listitem) {
					case 0: {
						SetVehicleParamsCarDoors(ControllingVvehicle[playerid], !Doors[ControllingVvehicle[playerid]][0], Doors[ControllingVvehicle[playerid]][1], 0, 0);
						return true;
					}
					case 1: {
						SetVehicleParamsCarDoors(ControllingVvehicle[playerid], Doors[ControllingVvehicle[playerid]][0], !Doors[ControllingVvehicle[playerid]][1], 0, 0);
						return true;
					}
				}
			} else {

			}
		}
		case DIALOG_CONTROL_TWODOORS_WINDOW: {
			if(response) {
				switch (listitem) {
					case 0: {
						SetVehicleParamsCarWindows(ControllingVvehicle[playerid], !Windows[ControllingVvehicle[playerid]][0], Windows[ControllingVvehicle[playerid]][1], 0, 0);
						return true;
					}
					case 1: {
						SetVehicleParamsCarWindows(ControllingVvehicle[playerid], Windows[ControllingVvehicle[playerid]][0], !Windows[ControllingVvehicle[playerid]][1], 0, 0);
						return true;
					}
				}
			}
		}
		case DIALOG_CONTROL_FOURDOORS_DOOR: {
			if(response) {
				switch (listitem) {
					case 0: {
						SetVehicleParamsCarDoors(ControllingVvehicle[playerid], !Doors[ControllingVvehicle[playerid]][0], Doors[ControllingVvehicle[playerid]][1], Doors[ControllingVvehicle[playerid]][2], Doors[ControllingVvehicle[playerid]][3]);
						return true;
					}
					case 1: {
						SetVehicleParamsCarDoors(ControllingVvehicle[playerid], Doors[ControllingVvehicle[playerid]][0], !Doors[ControllingVvehicle[playerid]][1], Doors[ControllingVvehicle[playerid]][2], Doors[ControllingVvehicle[playerid]][3]);
						return true;
					}
					case 2: {
						SetVehicleParamsCarDoors(ControllingVvehicle[playerid], Doors[ControllingVvehicle[playerid]][0], Doors[ControllingVvehicle[playerid]][1], !Doors[ControllingVvehicle[playerid]][2], Doors[ControllingVvehicle[playerid]][3]);
						return true;
					}
					case 3: {
						SetVehicleParamsCarDoors(ControllingVvehicle[playerid], Doors[ControllingVvehicle[playerid]][0], Doors[ControllingVvehicle[playerid]][1], Doors[ControllingVvehicle[playerid]][2], !Doors[ControllingVvehicle[playerid]][3]);
						return true;
					}
				}
			}
		}
		case DIALOG_CONTROL_FOURDOORS_WINDOW: {
			if(response) {
				switch (listitem) {
					case 0: {
						SetVehicleParamsCarWindows(ControllingVvehicle[playerid], !Windows[ControllingVvehicle[playerid]][0], Windows[ControllingVvehicle[playerid]][1], Windows[ControllingVvehicle[playerid]][2], Windows[ControllingVvehicle[playerid]][3]);
						return true;
					}
					case 1: {
						SetVehicleParamsCarWindows(ControllingVvehicle[playerid], Windows[ControllingVvehicle[playerid]][0], !Windows[ControllingVvehicle[playerid]][1], Windows[ControllingVvehicle[playerid]][2], Windows[ControllingVvehicle[playerid]][3]);
						return true;
					}
					case 2: {
						SetVehicleParamsCarWindows(ControllingVvehicle[playerid], Windows[ControllingVvehicle[playerid]][0], Windows[ControllingVvehicle[playerid]][1], !Windows[ControllingVvehicle[playerid]][2], Windows[ControllingVvehicle[playerid]][3]);
						return true;
					}
					case 3: {
						SetVehicleParamsCarWindows(ControllingVvehicle[playerid], Windows[ControllingVvehicle[playerid]][0], Windows[ControllingVvehicle[playerid]][1], Windows[ControllingVvehicle[playerid]][2], !Windows[ControllingVvehicle[playerid]][3]);
						return true;
					}
				}
			}
		}
	}
	return true;
}

CMD:cv(playerid, params[]) {
	ControllingVvehicle[playerid] = strval(params);
	GetVehicleParamsEx(ControllingVvehicle[playerid], Engine[ControllingVvehicle[playerid]], Lights[ControllingVvehicle[playerid]], alarm, doors, Hood[ControllingVvehicle[playerid]], Trunk[ControllingVvehicle[playerid]], objective);
	format(string, sizeof(string), "Doors\nVidros\nCapo\t\t\t\t%s\nMala\t\t\t\t%s\nMotor\t\t\t\t%s\nFarois\t\t\t\t%s",
		Hood[ControllingVvehicle[playerid]] == 1 ? "{00FF00}Aberto" : "{FF0000}Fechado",
		Trunk[ControllingVvehicle[playerid]] == 1 ? "{00FF00}Aberto" : "{FF0000}Fechado",
		Engine[ControllingVvehicle[playerid]] == 1 ? "{00FF00}Ligado" : "{FF0000}Desligado",
		Lights[ControllingVvehicle[playerid]] == 1 ? "{00FF00}Ligada" : "{FF0000}Desligada");
	ShowPlayerDialog(playerid, DIALOG_CONTROL, DIALOG_STYLE_LIST, "Controle Veicular", string, "Selecionar", "Sair");
	return 1;
}