/// @description

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
}

// Attack
if (!can_attack){
	timer_attack += 1;
	if (timer_attack >= attack_delay * room_speed) {
		timer_attack = 0;
		can_attack = true;
	}
}

// Invulnerability
if (invulnerable){
	timer_invulnerability += 1;
	if (timer_invulnerability >= invulnerability_delay * room_speed) {
		timer_invulnerability = 0;
		invulnerable = false;
	}
}

timer_inv += 1;
if (timer_inv >= 0.1 * room_speed) {timer_inv = 0;if (invulnerable){if (image_alpha != .7) image_alpha = .7;else image_alpha = .9;} else image_alpha = 1;}

#endregion