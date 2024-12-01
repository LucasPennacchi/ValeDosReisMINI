/// @description Writing Menu's items
draw_reset();

var _center_x = display_get_gui_width() / 2;
var _center_y = display_get_gui_height() / 2;
draw_set_font(fnt_menu);

if (state == STATE_MENU.MENU){
	var _i = 0;
	repeat (menu_items_length) {
		draw_set_color(COLOR.C2);
		if (menu_index == _i) draw_set_color(COLOR.C1);
		draw_text(_center_x, _center_y + (30 *_i),menu_items[_i]);
		_i++;
	}
}
else if (state == STATE_MENU.OPTIONS){
}
else if (state == STATE_MENU.CONTROLS){
	draw_set_halign(fa_left);
	
	draw_set_color(COLOR.C1);
	draw_text(_center_x/1.2,_center_y,
		"Up\n"+
		"Down\n"+
		"Left\n"+
		"Right\n"+
		"Roll\n"+
		"Attack\n"+
		"Interact\n"+
		"Pause\n"
	);
	draw_text(_center_x*1.2,_center_y,
		string(display_char(global.key_up))+"\n"+
		string(display_char(global.key_down))+"\n"+
		string(display_char(global.key_left))+"\n"+
		string(display_char(global.key_right))+"\n"+
		string(display_char(global.key_roll))+"\n"+
		string(display_char(global.key_attack))+"\n"+
		string(display_char(global.key_interact))+"\n"+
		string(display_char(global.key_pause))+"\n"
	);
}
else if (state == STATE_MENU.CREDITS){
}

draw_reset();