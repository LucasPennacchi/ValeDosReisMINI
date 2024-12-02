/// @description Inserir descrição aqui
event_inherited();

set_hp(3 + (2 * global.difficulty));
dmg = 0.5 + (0.5 * global.difficulty);
invulnerability_delay = 0.5 + (0.2 * global.difficulty);
attacking = false;

function attack(){
	if (sprite_index != spr_roll_beetle_hide && !attacking){
		sprite_index = spr_roll_beetle_hide;
		
		if(ceil(image_index) >= image_number - 0.1){
			sprite_index = spr_roll_beetle_roll;
			attacking = true;
		}
	}
	if (sprite_index == spr_roll_beetle_roll){
		if (collision(oCollision)){
			sprite_index = spr_roll_beetle_roll;
		}
	}
	if (sprite_index == spr_roll_beetle_roll){
		
	}
	
}