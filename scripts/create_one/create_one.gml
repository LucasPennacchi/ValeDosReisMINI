// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function create_one(_instance, _layer = "Instances", _x = x, _y = y){
	if (!instance_exists(_instance)) instance_create_layer(_x,_y,_layer,_instance);
	return _instance;
}