/// @description Draw Pause
draw_reset();
if (global.pause){
	draw_set_color(c_black);
	draw_set_alpha(.7);
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
	draw_reset();
	
	var center_x = display_get_gui_width() / 2;
	var center_y = display_get_gui_height() / 2;
	draw_set_font(fnt_menu);
	draw_text(center_x,center_y,"Paused");
}

draw_reset();