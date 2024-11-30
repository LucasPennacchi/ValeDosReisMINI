function collision(object){
	var _flag = false;
	if(place_meeting(self.x+self.velh, self.y, object)){
		while(!place_meeting(self.x+sign(self.velh), self.y, object)) self.x+=sign(self.velh);
		self.velh = 0;
		_flag = true;
	}
	if(place_meeting(self.x, self.y+self.velv, object)){
		while(!place_meeting(self.x, self.y+sign(self.velv), object)) self.y+=sign(self.velv);
		self.velv = 0;
		_flag = true;
	}
	
	return _flag;
}