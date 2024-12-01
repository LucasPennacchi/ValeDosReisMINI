/// @description Player default create
event_inherited(); // oEntity default create

#region DEFAULT (DO NOT CHANGE)

depth = 5;
instance_create_layer(x,y,"Instances",obj_player_shadow);
state = state_player.run;
origin = [x,y];

can_roll = true;
can_attack = true;
can_move = true;
move_dir = 0;
return_pos = last_pos;
ep_lost = false;

#region TIMERS

timer_roll = 0;
timer_ep = 0;

#endregion

#endregion

#region PLAYER ATTRIBUTES (CAN CHANGE)

hp_max = 5;
hp = 1;

dmg = 1;
velc = .8;
velc_modifier = 1;

ep_max = 10;
ep = ep_max;
ep_delay = 2;

weapon = oWeapon;
if (instance_exists(weapon)){
	atk_ep = -weapon.ep_cost;
	atk_delay = weapon.atk_delay;
}

roll_ep = -.5;
roll_delay = 0.3;


#endregion

#region FUNCTIONS

function stateEnergy (_modifier, _allowBelowZero = false){
	if (!(_allowBelowZero) && (ep + _modifier < 0)) return false;
	ep += _modifier;
	if (_modifier < 0) ep_lost = true;
	if (ep > ep_max) ep = ep_max;
	if (ep < 0) ep = 0;
	return true;
}
function changeState(_move_key = false, _roll_key= false, _attack_key= false){
	if (_attack_key && can_attack && stateEnergy(atk_ep)) state = state_player.attack;
	else if (_move_key && can_move){
		state = state_player.run;
		if (_roll_key && can_roll && stateEnergy(roll_ep)) state = state_player.roll;
	} else if (velh == 0 && velv == 0) state = state_player.idle;
}

#endregion
