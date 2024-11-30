/// @description Writing Menu's items
draw_reset_text();

var center_x = display_get_gui_width() / 2;
var center_y = display_get_gui_height() / 2;

if (state == state_menu.menu){
	var i = 0;
	draw_set_font(fnt_menu);
	repeat (menu_items_length) {
		draw_set_color(#596989);
		if (menu_index == i) draw_set_color(#cbdbfc);
		draw_text(center_x, center_y + (30 *i),menu_items[i]);
		i++;
	}
}

draw_reset_text();