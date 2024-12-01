// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
/// @desc Function Description
/// @param {real} _difficulty Description
/// @returns {string} Description
function draw_difficulty(_difficulty){
	var _name = "";
	switch (_difficulty){
		case (0): {
			_name = "Easy";
		}
		break;
		case (1): {
			_name = "Medium";
		}
		break;
		case (2): {
			_name = "Hard";
		}
		break;
		case (3): {
			_name = "Extreme";
		}
		break;
	}
	return _name;
}