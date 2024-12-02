if (!audio_is_playing(snd_track_menu)) audio_play_sound_on(global.music_emitter,snd_track_menu,1,true);

switch (room) {
	case (rm_menu) :
	{
		if (last_room != room) {
			switched = true;
		}
		if (switched) if (fade_out(snd_track_lobby)) switched = false;
		else fade_in(snd_track_menu);
	}
	break;
	case (rm_lobby) :
	{
		if (last_room != room) {
			switched = true;
		}
		if (switched) if (fade_out(snd_track_menu)) switched = false;
		else fade_in(snd_track_lobby);
	}
	break;
	case (rm_dungeon) :
	{
		fade_in(snd_track_menu);
	}
	break;
	
}
last_room = room