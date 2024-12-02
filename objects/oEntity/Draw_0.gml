/// @description Inserir descrição aqui

draw_self();
function draw_hp_bar (_hp, _ahp_max, _bar_hp_y_distance = 2) {
	draw_reset();
	draw_text(x,y-10,string(_hp) + "/" + string(_ahp_max));
	var _bar_hp_width = 5;
	var _bar_hp_heigth = .1;
	
	draw_healthbar(
		x - (_bar_hp_width / 2), y - (_bar_hp_heigth / 2) + _bar_hp_y_distance,
		x + (_bar_hp_width / 2), y  + (_bar_hp_heigth / 2) + _bar_hp_y_distance,
		100 * (_hp/_ahp_max),
		COLOR.C3, COLOR.C1, COLOR.C1,
		0, true, false);
	draw_reset();
	
}
draw_reset();