/// @description Inserir descrição aqui

draw_self();
function draw_hp_bar (_hp, _hp_max, _bar_hp_y_distance = 2, _bar_hp_width = 5, _bar_hp_heigth = .1, _text = false) {
	draw_reset();
	if (_text) draw_text(x,y-10,string(_hp) + "/" + string(_hp_max));
	
	draw_healthbar(
		x - (_bar_hp_width / 2), y - (_bar_hp_heigth / 2) + _bar_hp_y_distance,
		x + (_bar_hp_width / 2), y  + (_bar_hp_heigth / 2) + _bar_hp_y_distance,
		100.0 * (_hp/_hp_max),
		COLOR.D3, COLOR.D2, COLOR.D1,
		0, true, false);
	draw_reset();
	
}
draw_reset();