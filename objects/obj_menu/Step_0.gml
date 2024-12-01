/// @description How the menu will be controlled

switch (state){
	case STATE_MENU.TITLE:
	{	
		if (keyboard_check_pressed(vk_anykey) && !title_fade){
			title_fade = true;
			audio_play_sound(snd_menu_select,1,false);
		}
		if(!title_fade){
			if (title.image_alpha < 1) title.image_alpha += .1;
			if (title.y != 32) title.y = lerp(title.y,32,0.1);
		} else {
			if (title.image_alpha > 0){
				title.image_alpha -= .1;
				if (title.y != 0) title.y = lerp(title.y,0,0.1);
			} else state = STATE_MENU.MENU;
		}
	}
	break;
	case STATE_MENU.MENU:
	{
		var _menu_move = (keyboard_check_pressed(global.key_down)) - (keyboard_check_pressed(global.key_up));
		menu_index += _menu_move;
		if (menu_index < 0) menu_index = menu_items_length - 1;
		if (menu_index > menu_items_length - 1) menu_index = 0;

		if (menu_index != last_selected) audio_play_sound(snd_menu_select,1,false);

		last_selected = menu_index;
		
		if (keyboard_check_pressed(vk_space)){
			audio_play_sound(snd_menu_select_1,1,false);
			menu_choose(menu_index);
		}
	}
	break;
	
	case STATE_MENU.OPTIONS:
	{
		if (keyboard_check_pressed(vk_space)){
			audio_play_sound(snd_menu_select_1,1,false);
			state = STATE_MENU.MENU;
		}
	}
	break;
	
	case STATE_MENU.CONTROLS:
	{
		if (keyboard_check_pressed(vk_space)){
			audio_play_sound(snd_menu_select_1,1,false);
			state = STATE_MENU.MENU;
		}
	}
	break;
	
	case STATE_MENU.CREDITS:
	{
		if (keyboard_check_pressed(vk_space)){
			audio_play_sound(snd_menu_select_1,1,false);
			state = STATE_MENU.MENU;
		}
	}
	break;
	
	case STATE_MENU.QUIT:
	{
		game_end();
	}
	break;

}