/// @description Player
if (variable_global_exists("pause")){
	if (global.pause){
		image_speed = 0;
		exit;
	}
}

event_inherited(); // oEntity default step


#region PLAYER INPUTS
var _key_up = keyboard_check(global.key_up);
var _key_down = keyboard_check(global.key_down);
var _key_left = keyboard_check(global.key_left);
var _key_right = keyboard_check(global.key_right);
var _move_key = ((_key_down - _key_up != 0) || (_key_right - _key_left != 0));

var _roll_key = keyboard_check_pressed(global.key_roll);
var _interact_key = keyboard_check_pressed(global.key_interact);
var _attack_key = keyboard_check(global.key_attack);
#endregion


weapon = create_one(weapon,"Hitboxes");
weapon.target = self;

if (hp <= 0) state = STATE_PLAYER.DIE;
if (place_meeting(x,y,obj_hole) && state != STATE_PLAYER.FALL && !invulnerable){
	state = STATE_PLAYER.FALL;
	audio_play_sound(snd_fall,1,false);
	return_pos = last_pos;
}

velh = 0;
velv = 0;


switch (state){
	case STATE_PLAYER.SPAWN:
	{
		if (!spawned){
			spawned = true;
			
			y = 0;
			if (room == rm_lobby) origin = [64,56];
			else if (room == rm_menu) origin = [room_width/2,room_height/2];
		}
		
		x = origin[0];
		y = lerp(y,origin[1],.1);
		
		if (round(y) == origin[1]){
			audio_play_sound(snd_spawn,1,false);
			state = STATE_PLAYER.IDLE;
		}
	}
	break;
	
	case STATE_PLAYER.IDLE:
	{
		if (sprite_index != spr_player_idle){
			sprite_index = spr_player_idle;
			image_index = 0;
		}
		image_speed = 6;
		
		change_state(_move_key,_roll_key,_attack_key);
		
	}
	break;
	
	case STATE_PLAYER.WALK:
	{
	}
	break;
	
	case STATE_PLAYER.RUN:
	{
		if (sprite_index != spr_player_run){
			sprite_index = spr_player_run;
			image_index = 0;
		}
		
		timer_run += 1;
		if (timer_run > 20){
			//audio_play_sound(snd_roll,1,false);
			timer_run = 0;
		}
		
		var _velocity = velc;
		image_speed = 14*_velocity;
		
		move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up));
		velh = lengthdir_x(_velocity * _move_key, move_dir);
		velv = lengthdir_y(_velocity * _move_key, move_dir);
		
		change_state(_move_key,_roll_key,_attack_key);
		
		collision(oCollision);
		x += velh;
		y += velv;
	}
	break;
	
	case STATE_PLAYER.FOLLOW:
	{
	}
	break;
	
	case STATE_PLAYER.ROLL:
	{
		if (sprite_index != spr_player_roll){
			sprite_index = spr_player_roll;
			image_index = 0;
			move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up));
			invulnerable = true;
			audio_play_sound(snd_roll,1,false);
		}
		var _velocity = velc * 2;
		image_speed = 20*_velocity;
		
		velh = lengthdir_x(_velocity, move_dir);
		velv = lengthdir_y(_velocity, move_dir);
		
		collision(oCollision);
		x += velh;
		y += velv;
		
		if(ceil(image_index) >= image_number - 0.1){
			state = STATE_PLAYER.IDLE;
			invulnerable = false;
			can_roll = false;
		}
	}
	break;
	
	case STATE_PLAYER.ATTACK: // REMOVED
	{
		with(weapon){
		attacking = true;
		}
		can_atk = false;
		atk_ep = (-1) * weapon.ep_cost;
		atk_delay = weapon.atk_delay;
		state = STATE_PLAYER.IDLE;
	}
	break;
	
	case STATE_PLAYER.TAKE_DMG:
	{
		if (sprite_index != spr_player_take_dmg){
			sprite_index = spr_player_take_dmg;
			image_index = 0;
			//move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up));
			invulnerable = true;
			audio_play_sound(snd_take_dmg,2,false);
		}
		
		image_speed = 10;
		timer_invulnerability = 0;
		
		if(ceil(image_index) >= image_number - 0.1){
			state = STATE_PLAYER.IDLE;
		}
	}
	break;
	
	case STATE_PLAYER.DIE:
	{
		if (sprite_index != spr_player_die){
			sprite_index = spr_player_die;
			image_index = 0;
		}
		image_speed = 2;
		
		if(ceil(image_index) >= image_number - 0.1){
			instance_create_layer(x,y,"Menu",obj_blackout);
			if (obj_blackout.alpha >= .98) room_goto(rm_lobby);
			state = STATE_PLAYER.SPAWN;
		}
	}
	break;
	
	case STATE_PLAYER.FALL:
	{
		timer_last_pos = 0;
		var _hole = instance_nearest(x,y,obj_hole)
		if (sprite_index != spr_player_idle){
			sprite_index = spr_player_idle;
			image_index = 0;
			image_speed = 0;
		}
		x = lerp(x,_hole.x,0.2);
		y = lerp(y,_hole.y,0.2);
		image_angle += 4;
		image_xscale *= .96;
		image_yscale *= .96;
		
		if (abs(image_xscale) <= .3) {
			image_xscale = 1;
			image_yscale = 1;
			image_angle = 0;
			if (_hole.send_to != -1){
				room_goto(_hole.send_to);
				spawned = false;
				state = STATE_PLAYER.SPAWN;
			} else {
				x = return_pos[0];
				y = return_pos[1];
				state = STATE_PLAYER.IDLE;
			}
			invulnerable = true;
		}
	}
	break;
}

#region TIMERS
// Roll
if (!can_roll){
	timer_roll += 1;
	if (timer_roll >= roll_delay * global.frames_per_second) {
		timer_roll = 0;
		can_roll = true;
	}
} else timer_roll = 0;

// Energy Points
if (ep_lost){
	timer_ep += 1;
	if (timer_ep >= ep_delay * global.frames_per_second) {
		timer_ep = 0;
		ep_lost = false;
	}
} else timer_ep = 0;

// Energy Points Recovery
if (!ep_lost){
	if (ep < ep_max) ep += .05;
	else ep = ep_max;
}

#endregion