/// @description
event_inherited();

#region TAKE DAMAGE
if (instance_exists(obj_player)){
	var _weapon_player = obj_player.weapon;
	
	switch (_weapon_player.name){
		case "Sword": {
			if (!invulnerable && place_meeting(x,y,_weapon_player) && _weapon_player.attacking){
				// TAKE DAMAGE
				invulnerable = true;
				hp -= _weapon_player.dmg;
			}
		}
		break;
		case "": {
			
		}
		break;
		case "": {
			
		}
		break;
		case "": {
			
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
		
		}break;
		case STATE_ENEMY.FOLLOW: {
		
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