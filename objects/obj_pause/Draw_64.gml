/// @description Draw Pause
var _gui_x = display_get_gui_width();
var _gui_y = display_get_gui_height();

draw_reset();
if (global.pause){
	draw_set_color(c_black);
	draw_set_alpha(.7);
	draw_rectangle(0,0,_gui_x,_gui_y,false);
	draw_reset();
	
	var _center_x = display_get_gui_width() / 2;
	var _center_y = display_get_gui_height() / 2;
	draw_set_font(fnt_menu);
	draw_text(_center_x,_center_y,"Paused");
}

draw_reset();