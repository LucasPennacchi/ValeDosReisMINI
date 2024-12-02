if (global.pause) var _fade_pause = 0.3;
else _fade_pause = 1;

audio_emitter_gain(global.music_emitter, fade * _fade_pause);
var _sound = snd_track_menu;
switch (room) {
	case (rm_menu) :
	{
		var _sound = snd_track_menu;
	}
	break;
	case (rm_lobby) :
	{
		var _sound = snd_track_lobby;
	}
	break;
	case (rm_dungeon) :
	{
		var _sound = snd_track_lobby;
	}
	break;
}

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

last_room = room