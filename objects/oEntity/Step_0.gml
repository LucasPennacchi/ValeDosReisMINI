/// @description
if (variable_global_exists("pause")){
	if (global.pause){
		image_speed = 0;
		exit;
	}
}

if(velh!=0 && !stunned){
	if (sign(velh) == -1 && image_xscale > 0) image_xscale *= -1;
	else if (sign(velh) == 1 && image_xscale < 0) image_xscale *= -1;
}


#region TIMERS
// Stun
if (stunned){
	timer_stun += 1;
	if (timer_stun >= stun_delay * room_speed) {
		timer_stun = 0;
		stunned = false;
	}
} else timer_stun = 0;

// Attack
if (!can_atk){
	timer_atk += 1;
	if (timer_atk >= atk_delay * room_speed) {
		timer_atk = 0;
		can_atk = true;
	}
} else timer_atk = 0;

// Invulnerability
if (invulnerable){
	timer_invulnerability += 1;
	if (timer_invulnerability >= invulnerability_delay * room_speed) {
		timer_invulnerability = 0;
		invulnerable = false;
	}
} else timer_invulnerability = 0;

// Save last pos (timed by last_pos_delay)
if (state != STATE_PLAYER.FALL){
	timer_last_pos += 1;
	if (timer_last_pos >= last_pos_delay * room_speed) {
		timer_last_pos = 0;
		last_pos = [x,y];
	}
} else timer_last_pos = 0;


timer_inv += 1;
if (timer_inv >= 0.1 * room_speed) {timer_inv = 0;if (invulnerable){if (image_alpha != .7) image_alpha = .7;else image_alpha = .9;} else image_alpha = 1;}

#endregion