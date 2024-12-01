/// @description Player default create
event_inherited(); // oEntity default create

#region DEFAULT (DO NOT CHANGE)

depth = 5;
instance_create_layer(x,y,"Instances",obj_player_shadow);
state = STATE_PLAYER.IDLE;
origin = [x,y];

can_roll = true;
can_atk = true;
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
hp = 3;

dmg = 1;
velc = .8;
velc_modifier = 1;

ep_max = 5;
ep = ep_max;
ep_delay = 1;

weapon = obj_weapon_sword;
weapon = create_one(weapon,"Hitboxes");
weapon.target = self;

atk_ep = (-1) * weapon.ep_cost;
atk_delay = weapon.atk_delay;

roll_ep = -1;
roll_delay = 0.3;


#endregion

#region FUNCTIONS

function state_energy (_modifier, _allow_below_zero = false){
	if (!(_allow_below_zero) && (ep + _modifier < 0)) return false;
	ep += _modifier;
	if (_modifier < 0) {
		ep_lost = true
		timer_ep = 0;
	}
	if (ep > ep_max) ep = ep_max;
	if (ep < 0) ep = 0;
	return true;
}
function change_state(_move_key = false, _roll_key= false, _attack_key= false){
	if (_attack_key && can_atk && state_energy(atk_ep)) attack(); //state = STATE_PLAYER.ATTACK;
	else if (_move_key && can_move){
		state = STATE_PLAYER.RUN;
		if (_roll_key && can_roll && state_energy(roll_ep)) state = STATE_PLAYER.ROLL;
	} else if (velh == 0 && velv == 0) state = STATE_PLAYER.IDLE;
}

function attack(){
	with(weapon){
		attacking = true;
		audio_play_sound(sound,1,false);
	}
	can_atk = false;
	atk_ep = (-1) * weapon.ep_cost;
	atk_delay = weapon.atk_delay;
	
}

#endregion
