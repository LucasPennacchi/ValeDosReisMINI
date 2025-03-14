/// @description Starting point
state = STATE_MENU.TITLE;

title = obj_title;
instance_create_layer(64,0,"Menu",title);
title.image_alpha = 0;
title_fade = false;

if (instance_exists(obj_pause)) instance_destroy(obj_pause);
if (instance_exists(obj_player)) instance_destroy(obj_player);

menu_items = ["New game","Load","Options","Controls","Credits","Quit"];
menu_items_length = array_length(menu_items);
menu_index = 0;
last_selected = 0;


function menu_choose (_menu_index){
	switch (_menu_index){
		case 0:
		{
			var _center_x = room_width / 2;
			var _center_y = room_height / 2;
			create_one(obj_player,,_center_x,_center_y);
			create_one(obj_pause,"Menu");
			instance_destroy();
		}
		break;
		case 1:
		{
		}
		break;
		case 2:
		{
			state = STATE_MENU.OPTIONS;
		}
		break;
		case 3:
		{
			state = STATE_MENU.CONTROLS;
		}
		break;
		case 4:
		{
			state = STATE_MENU.CREDITS;
		}
		break;
		case 5:
		{
			state = STATE_MENU.QUIT;
		}
		break;
		
	}
}

