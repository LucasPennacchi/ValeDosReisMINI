// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function knockback(_origin, _force = 10){
	var _dir = point_direction(x,y,_origin.x,_origin.y) + random_range(-10,10);
	velh = -lengthdir_x(_force,_dir);
	velv = -lengthdir_y(_force,_dir);
	if (!collision(oCollision)){
		x += velh;
		y += velv;
	}
}