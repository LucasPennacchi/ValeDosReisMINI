event_inherited(); // Draw self;

draw_hp_bar(self.hp,self.hp_max);

#region EP BAR

var _bar_ep_width = 5;
var _bar_ep_heigth = .1;
var _bar_ep_y_distance = 4;

draw_healthbar(
	x - (_bar_ep_width / 2), y - (_bar_ep_heigth / 2) + _bar_ep_y_distance,
	x + (_bar_ep_width / 2), y  + (_bar_ep_heigth / 2) + _bar_ep_y_distance,
	100 * (ep/ep_max),
	COLOR.C3, COLOR.C1, COLOR.C1,
	0, true, false);
#endregion

draw_reset();