/// @description Inserir descrição aqui
event_inherited();

set_hp(3 + (2 * global.difficulty));
dmg = 0.5 + (0.5 * global.difficulty);
invulnerability_delay = 0.5 + (0.2 * global.difficulty);
atk_delay = 2.1 - ((global.difficulty + 1)/10);
velc = .5;
velc_origin = velc;
velc_roll = 1;

atk_range = 20;
follow_range = 40;

attacking = false;

function attack(){
	image_speed = 5 * velc;
	if (sprite_index != spr_roll_beetle_hide && !attacking){ // HIDE
		sprite_index = spr_roll_beetle_hide;
	}
	if(sprite_index == spr_roll_beetle_hide && ceil(image_index) >= image_number - 0.1){ // START ROLLING
		sprite_index = spr_roll_beetle_roll;
		attacking = true;
		move_dir = point_direction(x,y,obj_player.x,obj_player.y);
	}
	if (sprite_index == spr_roll_beetle_roll){ // WHILE ROLLING
		velc = velc_roll;
		image_speed = 15 * velc;
		
		velh = lengthdir_x(velc,move_dir);
		velv = lengthdir_y(velc,move_dir);
		
		if (collision(oCollision)){ // IF COLLIDED WITH SOMETHING, STOP
			//var _fix_collision = 9;
			//velh = -_fix_collision * lengthdir_x(velc,move_dir);
			//velv = -_fix_collision * lengthdir_y(velc,move_dir);
			nearest_free_spot(oCollision,10);
			state = STATE_ENEMY.IDLE;
			attacking = false;
			velc = velc_origin;
			can_atk = false;
		}
		
		x += velh;
		y += velv;
	}
}

function idle(){
	if (sprite_index != spr_roll_beetle_idle){
		sprite_index = spr_roll_beetle_idle;
		image_index = 0;
	}
	velc = velc_origin;
	image_speed = 1;
}
function run(){
	if (sprite_index != spr_roll_beetle_run){
		sprite_index = spr_roll_beetle_run;
		image_index = 0;
	}
	velc = velc_origin;
	image_speed = 10 * velc;
}