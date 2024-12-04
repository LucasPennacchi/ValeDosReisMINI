function collision(_object){
	var _flag = false;
	if(place_meeting(x+velh, y, _object)){
		while(!place_meeting(x+sign(velh), y, _object)) x+=sign(velh);
		velh = 0;
		_flag = true;
	}
	if(place_meeting(x, y+velv, _object)){
		while(!place_meeting(x, y+sign(velv), _object)) y+=sign(velv);
		velv = 0;
		_flag = true;
	}
	
	return _flag;
}