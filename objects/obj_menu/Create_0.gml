/// @description Starting point
state = state_menu.title;

title = obj_title;
instance_create_layer(64,0,"Menu",title);
title.image_alpha = 0;
title_fade = false;


menu_items = ["New game","Load","Options","Controls","Credits","Quit"];
menu_items_length = array_length(menu_items);
menu_index = 0;
last_selected = 0;

function menu_choose (menu_index){
	switch (menu_index){
		case 0:
		{
		}
		break;
		case 1:
		{
		}
		break;
		case 2:
		{
			state = state_menu.options;
		}
		break;
		case 3:
		{
			state = state_menu.controls;
		}
		break;
		case 4:
		{
			state = state_menu.credits;
		}
		break;
		case 5:
		{
			state = state_menu.quit;
		}
		break;
		
	}
}