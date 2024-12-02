/// @description Some attributes
hp_max = 10;
hp = hp_max

#region COMBAT
dmg = 1;
can_atk = true;
atk_delay = 1
#endregion
#region MOVEMENT
velh = 0;
velv = 0;
velc = 1; // Default velocity
velc_modifier = 1;
can_move = true;
move_dir = 0;
path = path_add();
#endregion

stunned = false
stun_delay = 1;

invulnerable = false;
invulnerability_delay = 1;

last_pos = [x,y];
last_pos_delay = 1;

#region TIMERS
	timer_stun = 0;
	timer_invulnerability = 0;
	timer_inv = 0;
	timer_atk = 0;
	timer_last_pos = 0;
#endregion

#region FUNCTIONS
function set_hp(_hp){
	max_hp = _hp;
	hp = max_hp;
}

#endregion