/// @description Inserir descrição aqui
if (variable_global_exists("pause")){
	if (global.pause){
		image_speed = 0;
		exit;
	}
}
event_inherited();