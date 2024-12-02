/// @description Inserir descrição aqui

if (global.show_hp_bar){
	draw_reset()

	var _bar_hp_width = 200;
	var _bar_hp_heigth = 10;
	var _bar_hp_x = 20;
	var _bar_hp_y = 20;

	draw_set_color(COLOR.C3);
	draw_rectangle(_bar_hp_x - 5,_bar_hp_y - 5,_bar_hp_x + _bar_hp_width + 5 + 50,_bar_hp_y + _bar_hp_heigth + 5,false);
	draw_set_color(COLOR.C1);
	draw_rectangle(_bar_hp_x,_bar_hp_y,_bar_hp_x + (_bar_hp_width * (hp/hp_max)),_bar_hp_y + _bar_hp_heigth,false);

	draw_set_halign(fa_left);
	draw_text(_bar_hp_x + _bar_hp_width + 10, _bar_hp_y + _bar_hp_heigth - 2, string(hp) + "/" + string(hp_max));
}
draw_reset()
