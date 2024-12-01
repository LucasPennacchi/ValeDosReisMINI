draw_reset();

var _center_x = display_get_gui_width() / 2;
var _center_y = display_get_gui_height() / 2;
draw_set_font(fnt_menu);

draw_set_halign(fa_left);
var _i = 0;
repeat (config_items_length) {
	draw_set_color(COLOR.C2);
	if (config_index == _i) draw_set_color(COLOR.C1);
	draw_text(_center_x/1.2, _center_y + (30 *_i),config_items[_i]);
	draw_text(_center_x*1.2, _center_y + (30 *_i),config_items_final[_i]);
	_i++;
}

draw_reset();