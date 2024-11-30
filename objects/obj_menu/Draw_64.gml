/// @description Writing Menu's items
draw_reset();

var center_x = display_get_gui_width() / 2;
var center_y = display_get_gui_height() / 2;
draw_set_font(fnt_menu);

if (state == state_menu.menu){
	var i = 0;
	repeat (menu_items_length) {
		draw_set_color(#596989);
		if (menu_index == i) draw_set_color(#cbdbfc);
		draw_text(center_x, center_y + (30 *i),menu_items[i]);
		i++;
	}
}
else if (state == state_menu.options){
}
else if (state == state_menu.controls){
	draw_set_halign(fa_left);
	
	draw_set_color(#cbdbfc);
	draw_text(center_x/1.2,center_y,
		"Up\n"+
		"Down\n"+
		"Left\n"+
		"Right\n"+
		"Roll\n"+
		"Attack\n"+
		"Interact\n"+
		"Pause\n"
	);
	draw_text(center_x*1.2,center_y,
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
else if (state == state_menu.credits){
}

draw_reset();