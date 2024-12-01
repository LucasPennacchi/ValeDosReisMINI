/// @description Enter after fade
if (variable_global_exists("pause")){
	if (global.pause){
		image_speed = 0;
		exit;
	}
}

// Delay
if (!can_enter){
	timer_enter += 1;
	if (timer_enter >= delay * room_speed) {
		timer_enter = 0;
		can_enter = true;
	}
} else timer_enter = 0;

if (instance_exists(obj_player) && can_enter){
	touching = place_meeting(x,y,obj_player)
}

if (touching && !instance_exists(obj_blackout)){
	instance_create_layer(x,y,"Menu",obj_blackout);
} else if (!touching && instance_exists(obj_blackout)){
	instance_destroy(obj_blackout);
} else if (touching && instance_exists(obj_blackout)){
	if (obj_blackout.alpha >= .98) room_goto(rm_dungeon);
}