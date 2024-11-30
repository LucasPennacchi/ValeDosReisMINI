/// @description Player
if (global.pause){
	image_speed = 0;
	exit;
}
event_inherited(); // oEntity default step

var _key_up = keyboard_check(global.key_up);
var _key_down = keyboard_check(global.key_down);
var _key_left = keyboard_check(global.key_left);
var _key_right = keyboard_check(global.key_right);

var _move_key = ((_key_down - _key_up != 0) || (_key_right - _key_left != 0));
var _move_dir = point_direction(0,0,(_key_right - _key_left), (_key_down - _key_up))


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
		velh = lengthdir_x(velc * _move_key, _move_dir);
		velv = lengthdir_y(velc * _move_key, _move_dir);

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