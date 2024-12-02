
audio_emitter_gain(global.music_emitter, fade);

switch (room) {
	case (rm_menu) :
	{
		var _sound = snd_track_menu;
		
		if (last_room != room) {
			switched = true;
		}
		if (switched) {
			if (fade_out()){
				audio_stop_all();
				if (!audio_is_playing(_sound)) audio_play_sound_on(global.music_emitter,_sound,1,true);
				switched = false;
			}
			
		}
		else fade_in();
	}
	break;
	case (rm_lobby) :
	{
		var _sound = snd_track_lobby;
		if (last_room != room) {
			switched = true;
		}
		if (switched) {
			if (fade_out()){
				audio_stop_all();
				if (!audio_is_playing(_sound)) audio_play_sound_on(global.music_emitter,_sound,1,true);
				switched = false;
			}
			
		}
		else fade_in();
	}
	break;
	case (rm_dungeon) :
	{
		fade_in(snd_track_menu);
	}
	break;
	
}
last_room = room