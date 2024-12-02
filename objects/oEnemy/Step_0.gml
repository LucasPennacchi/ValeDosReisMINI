/// @description
event_inherited();

//if (instance_exists(oWeapon)) var _weapon_player = instance_nearest(x,y,oWeapon);
//if (_weapon_player.target == obj_player && _weapon_player.attacking && place_meeting(x,y,_weapon_player) && !invulnerable){
	
//}

if (instance_exists(obj_player)){
	var _weapon_player = obj_player.weapon;
	if (!invulnerable && place_meeting(x,y,_weapon_player) && _weapon_player.attacking){
		// TAKE DAMAGE
		invulnerable = true;
		hp -= _weapon_player.dmg;
	}
}

if (hp <= 0) instance_destroy();