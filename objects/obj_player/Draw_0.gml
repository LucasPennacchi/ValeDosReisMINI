draw_self();
draw_reset();

#region HP BAR

var _bar_hp_width = 5;
var _bar_hp_heigth = .1;
var _bar_hp_y_distance = 2;

//draw_set_color(color.c3);
//draw_rectangle(x - (_bar_hp_width / 2), y - (_bar_hp_heigth / 2) + _bar_hp_y_distance, x + (_bar_hp_width / 2),y  + (_bar_hp_heigth / 2) + _bar_hp_y_distance, false);
//draw_set_color(color.c1);
//draw_rectangle(x - (_bar_hp_width / 2), y - (_bar_hp_heigth / 2) + _bar_hp_y_distance, x - ((_bar_hp_width / 2) * (hp / hp_max)),y  + (_bar_hp_heigth / 2) + _bar_hp_y_distance, false);
//draw_reset();

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

//draw_set_color(color.c3);
//draw_rectangle(x - (_bar_ep_width / 2), y - (_bar_ep_heigth / 2) + _bar_ep_y_distance, x + (_bar_ep_width / 2),y  + (_bar_ep_heigth / 2) + _bar_ep_y_distance, false);
//draw_set_color(color.c1);
//draw_rectangle(x - (_bar_ep_width / 2), y - (_bar_ep_heigth / 2) + _bar_ep_y_distance, x - ((_bar_ep_width / 2) * (ep/ep_max)),y  + (_bar_ep_heigth / 2) + _bar_ep_y_distance, false);
//draw_reset();

draw_healthbar(
	x - (_bar_ep_width / 2), y - (_bar_ep_heigth / 2) + _bar_ep_y_distance,
	x + (_bar_ep_width / 2), y  + (_bar_ep_heigth / 2) + _bar_ep_y_distance,
	100 * (ep/ep_max),
	color.c3, color.c1, color.c1,
	0, true, false);
draw_text(x + (_bar_ep_width / 2) + 2, y  + (_bar_ep_heigth / 2) + _bar_ep_y_distance, string(ep) + "/" + string(ep_max));
#endregion
