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
var _attack_key = keyboard_check_pressed(global.key_attack);
#endregion



if (hp <= 0) state = state_player.die;
if (place_meeting(x,y,obj_hole) && state != state_player.fall && !invulnerable){
	state = state_player.fall;
	return_pos = last_pos;
}

velh = 0;
velv = 0;

switch (state){
	case state_player.spawn:
	{
		var _flag = false;
		if (invulnerable){
			invulnerable = false;
			y = 0;
		}
		if (room == rm_lobby){
			x = 64;
			y = lerp(y,56,.1);
			if (round(y) == 56) _flag = true;
		} else if (room == rm_menu) {
			instance_destroy();
		}
		
		if (_flag) state = state_player.idle;
	}
	break;
	
	case state_player.idle:
	{
		if (sprite_index != spr_player_idle){
			sprite_index = spr_player_idle;
			image_index = 0;
		}
		image_speed = 6;
		
		changeState(_move_key,_roll_key,_attack_key);
		
	}
	break;
	
	case state_player.walk:
	{
	}
	break;
	
	case state_player.run:
	{
		if (sprite_index != spr_player_run){
			sprite_index = spr_player_run;
			image_index = 0;
		}
		var _velocity = velc;
		image_speed = 14*_velocity;
		
		move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up));
		velh = lengthdir_x(_velocity * _move_key, move_dir);
		velv = lengthdir_y(_velocity * _move_key, move_dir);
		
		changeState(_move_key,_roll_key,_attack_key);
		
		collision(oCollision);
		x += velh;
		y += velv;
	}
	break;
	
	case state_player.follow:
	{
	}
	break;
	
	case state_player.roll:
	{
		if (sprite_index != spr_player_roll){
			sprite_index = spr_player_roll;
			image_index = 0;
			move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up));
			invulnerable = true;
		}
		var _velocity = velc * 2;
		image_speed = 20*_velocity;
		
		velh = lengthdir_x(_velocity, move_dir);
		velv = lengthdir_y(_velocity, move_dir);
		
		collision(oCollision);
		x += velh;
		y += velv;
		
		if(ceil(image_index) >= image_number - 0.1){
			state = state_player.idle;
			invulnerable = false;
			can_roll = false;
		}
	}
	break;
	
	case state_player.attack:
	{
	}
	break;
	
	case state_player.take_dmg:
	{
	}
	break;
	
	case state_player.die:
	{
	}
	break;
	
	case state_player.fall:
	{
		var hole = instance_nearest(x,y,obj_hole)
		if (sprite_index != spr_player_idle){
			sprite_index = spr_player_idle;
			image_index = 0;
			image_speed = 0;
		}
		x = lerp(x,hole.x,0.2);
		y = lerp(y,hole.y,0.2);
		image_angle += 2;
		image_xscale *= .99;
		image_yscale *= .99;
		
		if (abs(image_xscale) <= .3) {
			image_xscale = 1;
			image_yscale = 1;
			image_angle = 0;
			if (hole.send_to != -1){
				room_goto(hole.send_to);
				state = state_player.spawn;
			} else {
				x = return_pos[0];
				y = return_pos[1];
				state = state_player.idle;
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
	if (timer_roll >= roll_delay * room_speed) {
		timer_roll = 0;
		can_roll = true;
	}
} else timer_roll = 0;

// Energy Points
if (ep_lost){
	timer_ep += 1;
	if (timer_ep >= ep_delay * room_speed) {
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