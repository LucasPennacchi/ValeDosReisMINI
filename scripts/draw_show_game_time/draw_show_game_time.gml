// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function draw_show_game_time(_game_time){
	var _name = "";
	switch (_game_time){
		case (0): {
			_name = "Never";
		}
		break;
		case (1): {
			_name = "Only in Pause";
		}
		break;
		case (2): {
			_name = "Always";
		}
		break;
	}
	return _name;
}