/// @description Inserir descrição aqui
global.music_emitter = audio_emitter_create();
fade = 0;
last_room = room;
switched = false;
function fade_out(_snd){
	fade -= 0.001;
	audio_emitter_gain(global.music_emitter, fade);
	if (fade <= 0) {
		audio_stop_sound(_snd);
		return true;
	}
	return false;
}

function fade_in(_snd, _loop = true){
	if (!audio_is_playing(_snd)) audio_play_sound_on(global.music_emitter,_snd,1,_loop)
	fade += 0.001;
	audio_emitter_gain(global.music_emitter, fade);
	if (fade >= 1) {
		return true;
	}
	return false;
}

