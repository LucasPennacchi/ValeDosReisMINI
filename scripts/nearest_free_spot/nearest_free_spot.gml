// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function nearest_free_spot(_obj,_max_distance = 10){
	randomize();
	
	var _dir = point_direction(x,y,x + random_range(-1, 1),y + random_range(-1, 1));
	var _len = random(_max_distance);
	var _velh = lengthdir_x(_len,_dir);
	var _velv = lengthdir_y(_len,_dir);
	
	while (place_meeting(x + _velh, y + _velv, _obj) && mp_grid_get_cell(obj_map.grid,x,y)){
		_dir = point_direction(x,y,x + random_range(-1, 1),y + random_range(-1, 1));
		_len = random(_max_distance);
		_velh = lengthdir_x(_len,_dir);
		_velv = lengthdir_y(_len,_dir);
	}
	
	x += _velh;
	y += _velv;
}