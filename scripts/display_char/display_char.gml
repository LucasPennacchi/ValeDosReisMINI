// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function display_char(character){
	var char_normal = "";
	switch (character){
		case (vk_up):{
			char_normal = "Up"
		}
		break;
		
		case (vk_down):{
			char_normal = "Down"
		}
		break;
		
		case (vk_left):{
			char_normal = "Left"
		}
		break;
		
		case (vk_right):{
			char_normal = "Right"
		}
		break;
		
		case (vk_shift):{
			char_normal = "Shift"
		}
		break;
		
		case (vk_escape):{
			char_normal = "Escape"
		}
		break;
		
		case (vk_control):{
			char_normal = "Ctrl"
		}
		break;
		
		case (vk_alt):{
			char_normal = "Alt"
		}
		break;
		
		case (vk_space):{
			char_normal = "Space"
		}
		break;
		
		case (vk_enter):{
			char_normal = "Enter"
		}
		break;
		
		case (vk_backspace):{
			char_normal = "Backspace"
		}
		break;
		
		default:{
			char_normal = chr(character);
		}
	}
	return char_normal;
}