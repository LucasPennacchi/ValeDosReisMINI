/// @description Inserir descrição aqui
window_set_fullscreen(global.fullscreen);

if (global.volume != last_volume) audio_master_gain(global.volume / 100);
last_volume = global.volume;

if (!global.pause && !global.dialogue && !instance_exists(oMenu)){
	global.game_time++;
}

