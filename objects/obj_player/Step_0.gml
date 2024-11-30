/// @description Player
if (global.pause){
	image_speed = 0;
	exit;
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

function stateEnergy (modifier, allowBelowZero = true){
	if (!(allowBelowZero) && (ep + modifier < 0)) return false;
	ep += modifier;
	if (ep > ep_max) ep = ep_max;
	if (ep < 0) ep = 0;
	return true;
}
function changeState(_move_key, _roll_key, _attack_key){
	if (_attack_key && can_attack && stateEnergy(atk_ep, false)) state = state_player.attack;
	else if (_move_key && can_move){
		state = state_player.run;
		if (_roll_key && can_roll && stateEnergy(roll_ep, false)) state= state_player.roll;
	} else if (vel_x == 0 && vel_y == 0) state = state_player.idle;
}

if (hp <= 0) state = state_player.die;

switch (state){
	case state_player.spawn:
	{
	}
	break;
	
	case state_player.idle:
	{
	}
	break;
	
	case state_player.walk:
	{
	}
	break;
	
	case state_player.run:
	{
		//if (slow) velc = velc_normal / 2;
		//else velc = velc_normal;
	
		sprite_index=spr_player_running;
		image_speed = 14*velc;

		var _move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up))
		velh = lengthdir_x(velc * _move_key, _move_dir);
		velv = lengthdir_y(velc * _move_key, _move_dir);
		
		//changeState();
		
		collision(oCollision);
		x += velh;
		y += velv;
	}
	break;
	
	case state_player.follow:
	{
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
	
}