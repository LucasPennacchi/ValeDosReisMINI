/// @description
event_inherited();

#region TAKE DAMAGE
if (instance_exists(obj_player)){
	var _weapon_player = obj_player.weapon;
	
	switch (_weapon_player.name){
		case "Sword": {
			if (!invulnerable && place_meeting(x,y,_weapon_player) && _weapon_player.attacking){
				// TAKE DAMAGE
				if (audio_is_playing(snd_weapon_sword)){
					audio_stop_sound(snd_weapon_sword);
					audio_play_sound(snd_weapon_sword_hit,1,false);
				}
				invulnerable = true;
				hp -= _weapon_player.dmg;
			}
		}
		break;
		case "Bow": {
			
		}
		break;
		case "Staff": {
			
		}
		break;
		case "Spear": {
			
		}
		break;
	}
	
}

if (hp <= 0) instance_destroy();

if (instance_exists(obj_player)){
	var _range = distance_to_object(obj_player);
	var _in_range_atk = _range <= atk_range;
	var _in_range_follow = _range <= follow_range;
	switch (state) {
		case STATE_ENEMY.SPAWN: {
		
		}break;
		case STATE_ENEMY.IDLE: {
			idle();
			change_state(_in_range_atk,_in_range_follow);
		}break;
		case STATE_ENEMY.FOLLOW: {
			run();
			move_to(obj_player, _in_range_follow && !_in_range_atk);
			change_state(_in_range_atk,_in_range_follow);
			
		}break;
		case STATE_ENEMY.WALK: {
			run();
			move_to(obj_player, _in_range_follow && !_in_range_atk);
			change_state(_in_range_atk,_in_range_follow);
			
	}break;
		case STATE_ENEMY.ATTACK: {
			attack();
		}break;
		case STATE_ENEMY.TAKE_DMG: {
		
		}break;
		case STATE_ENEMY.DIE: {
		
		}break;
	}
}