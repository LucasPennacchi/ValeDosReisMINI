function collision(_object){
	var _flag = false;
	if(place_meeting(self.x+self.velh, self.y, _object)){
		while(!place_meeting(self.x+sign(self.velh), self.y, _object)) self.x+=sign(self.velh);
		self.velh = 0;
		_flag = true;
	}
	if(place_meeting(self.x, self.y+self.velv, _object)){
		while(!place_meeting(self.x, self.y+sign(self.velv), _object)) self.y+=sign(self.velv);
		self.velv = 0;
		_flag = true;
	}
	
	return _flag;
}