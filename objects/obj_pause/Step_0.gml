/// @description Detect Pause
if (keyboard_check_pressed(global.key_pause)) {
	if (!global.pause) audio_play_sound(snd_pause_open,1,false);
	else audio_play_sound(snd_pause_close,1,false);
	global.pause = !global.pause;
}

if (last_room != room) {
	depth -= 1;
}

last_room = room;

