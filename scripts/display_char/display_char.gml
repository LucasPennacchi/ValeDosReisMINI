// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function display_char(_character){
	var _char_normal = "";
	switch (_character){
		case (vk_up):{
			_char_normal = "Up"
		}
		break;
		
		case (vk_down):{
			_char_normal = "Down"
		}
		break;
		
		case (vk_left):{
			_char_normal = "Left"
		}
		break;
		
		case (vk_right):{
			_char_normal = "Right"
		}
		break;
		
		case (vk_shift):{
			_char_normal = "Shift"
		}
		break;
		
		case (vk_escape):{
			_char_normal = "Escape"
		}
		break;
		
		case (vk_control):{
			_char_normal = "Ctrl"
		}
		break;
		
		case (vk_alt):{
			_char_normal = "Alt"
		}
		break;
		
		case (vk_space):{
			_char_normal = "Space"
		}
		break;
		
		case (vk_enter):{
			_char_normal = "Enter"
		}
		break;
		
		case (vk_backspace):{
			_char_normal = "Backspace"
		}
		break;
		
		default:{
			_char_normal = chr(_character);
		}
	}
	return _char_normal;
}