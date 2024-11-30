function move_to (object, condition = false){
	if (condition) {
		var _x1 = self.x;
		var _y1 = self.y;
		var _x2 = (object.x div 32) * 32 + 16;
		var _y2 = (object.y div 32) * 32 + 16;

		if (mp_grid_path(obj_map.grid, path, _x1, _y1, _x2, _y2, true)) {
		    path_start(self.path, self.velc, path_action_stop, false);
		}
	
		velh = lengthdir_x(self.velc,self.direction);
		velv = lengthdir_y(self.velc,self.direction);
	} else {
		path_end();
		path_speed = 0;
		velh = 0;
		velv = 0;
	}	
}