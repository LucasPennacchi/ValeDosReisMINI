/// @description Draw Pause
var _gui_x = display_get_gui_width();
var _gui_y = display_get_gui_height();


if (global.pause){
	draw_reset();
	
	draw_set_color(c_black);
	draw_set_alpha(.7);
	draw_rectangle(0,0,_gui_x,_gui_y,false);
	draw_reset();
	
	var _center_x = display_get_gui_width() / 2;
	var _center_y = display_get_gui_height() / 2;
	draw_set_font(fnt_menu);
	draw_text(_center_x,_center_y,"Paused");
}
if (global.show_game_time){
	draw_reset();
	draw_set_font(fnt_menu);
	draw_set_halign(fa_left);
	draw_text(_gui_x/16,_gui_y/9,"Time: " + string(global.game_time/global.frames_per_second));
}
draw_reset();