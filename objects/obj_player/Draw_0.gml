draw_self();
draw_reset();

#region HP BAR

var _bar_hp_width = 5;
var _bar_hp_heigth = .1;
var _bar_hp_y_distance = 2;

draw_healthbar(
	x - (_bar_hp_width / 2), y - (_bar_hp_heigth / 2) + _bar_hp_y_distance,
	x + (_bar_hp_width / 2), y  + (_bar_hp_heigth / 2) + _bar_hp_y_distance,
	100 * (hp/hp_max),
	color.c3, color.c1, color.c1,
	0, true, false);

#endregion

#region EP BAR

var _bar_ep_width = 5;
var _bar_ep_heigth = .1;
var _bar_ep_y_distance = 4;

draw_healthbar(
	x - (_bar_ep_width / 2), y - (_bar_ep_heigth / 2) + _bar_ep_y_distance,
	x + (_bar_ep_width / 2), y  + (_bar_ep_heigth / 2) + _bar_ep_y_distance,
	100 * (ep/ep_max),
	color.c3, color.c1, color.c1,
	0, true, false);
#endregion

draw_reset();