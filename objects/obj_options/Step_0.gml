config_items_origin = [draw_difficulty(real(global.difficulty)),string(global.volume),draw_boolean(global.fullscreen),"",draw_boolean(global.show_hp_bar),draw_show_game_time(real(global.show_game_time)),""];

if (!selected){
	config_items_final = config_items_origin;
	var _config_move = (keyboard_check_pressed(global.key_down)) - (keyboard_check_pressed(global.key_up));
	config_index += _config_move;
	if (config_index < 0) config_index = config_items_length - 1;
	if (config_index > config_items_length - 1) config_index = 0;
	if (config_index != last_selected) audio_play_sound(snd_menu_select,1,false);

	last_selected = config_index;
		
	if (keyboard_check_pressed(vk_space)){
		audio_play_sound(snd_menu_select_1,1,false);
		config_choose(config_index);
	}
} else {
	config_items_final[config_index] = "< " + config_items_origin[config_index] + " >"
	var _selected_move = (keyboard_check_pressed(global.key_right)) - (keyboard_check_pressed(global.key_left));
	
	switch (config_index){
		case 0:
		{
			
			if (global.difficulty + _selected_move <= 3 &&
				global.difficulty + _selected_move >= 0) global.difficulty += _selected_move;
			else {
				_selected_move = 0;
				audio_play_sound(snd_menu_invalid,1,false);
			}
		}
		break;
		case 1:
		{
			var _change = _selected_move * 10
			if (global.volume + _change >= 0 &&
				global.volume + _change <= 100) global.volume += _change;
			else {
				_selected_move = 0;
				audio_play_sound(snd_menu_invalid,1,false);
			}
		}
		break;
		case 5:
		{
			global.show_game_time += _selected_move
			if (global.show_game_time > 2) global.show_game_time = 0;
			if (global.show_game_time < 0) global.show_game_time = 2;
		}
		break;
	}
	if (_selected_move != 0) audio_play_sound(snd_menu_select,1,false);
	if (keyboard_check_pressed(vk_space)){
		audio_play_sound(snd_menu_select,1,false);
		config_items_final[config_index] = config_items_origin[config_index];
		selected = false;
	}		
}

