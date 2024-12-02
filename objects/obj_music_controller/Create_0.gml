/// @description Inserir descrição aqui
global.music_emitter = audio_emitter_create();
fade = 0;
last_room = room;
switched = false;
function fade_out(_snd){
	if (fade <= 0) {
		audio_stop_sound(_snd);
		return true;
	} else {
		fade = lerp(fade,0,0.01);
		audio_emitter_gain(global.music_emitter, fade);
	}
	return false;
}

function fade_in(_snd, _loop = true){
	if (!audio_is_playing(_snd)) audio_play_sound_on(global.music_emitter,_snd,1,_loop)
	
	if (fade >= 1) {
		return true;
	} else {
		fade = lerp(fade,1,0.01);
		audio_emitter_gain(global.music_emitter, fade);
	}
	return false;
}

