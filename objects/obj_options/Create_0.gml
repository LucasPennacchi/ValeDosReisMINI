config_items = ["Difficulty","Audio","Fullscreen","","Show game time","Back"];
config_items_final = ["","","","","",""];
config_items_origin = [draw_difficulty(real(global.difficulty)),global.volume,draw_boolean(global.fullscreen),"",draw_show_game_time(real(global.show_game_time)),""];
config_items_length = array_length(config_items);
config_index = 0;
last_selected = 0;
selected = false;

function config_choose (_config_index){
	switch (_config_index){
		case 0:
		{
			selected = true;
		}
		break;
		case 1:
		{
			selected = true;
		}
		break;
		case 2:
		{
			global.fullscreen = !global.fullscreen;
		}
		break;
		case 3:
		{
		}
		break;
		case 4:
		{
			selected = true;
		}
		break;
		case 5:
		{
			create_one(obj_menu,"Menu").state = STATE_MENU.MENU;
			instance_destroy();
		}
		break;
		
	}
}