/// @description Detect Pause
if (keyboard_check_pressed(global.key_pause)) global.pause = !global.pause;

if (last_room != room) {
	depth -= 1;
}

last_room = room;

