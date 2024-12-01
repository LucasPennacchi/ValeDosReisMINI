/// @description Some attributes
event_inherited();

hp_max = 1;
hp = hp_max

dmg = 1;
can_atk = true;
atk_delay = 1

velh = 0;
velv = 0;
velc = 1; // Default velocity
velc_modifier = 1;

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