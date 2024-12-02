/// @description Inserir descrição aqui
global.music_emitter = audio_emitter_create();
if (!audio_is_playing(snd_track_menu)) audio_play_sound_on(global.music_emitter,snd_track_menu,1,true);
fade = 0;
last_room = room;
switched = false;
function fade_out(){
	if (fade <= 0) {
		return true;
	} else {
		fade = lerp(fade,0,0.2);
	}
	return false;
}

function fade_in(_loop = true){
	if (fade >= 1) {
		return true;
	} else {
		fade = lerp(fade,1,0.1);
	}
	return false;
}

