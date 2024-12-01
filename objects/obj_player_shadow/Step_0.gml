/// @description Align with Player
if (variable_global_exists("pause")){
	if (global.pause){
		image_speed = 0;
		exit;
	}
}
if (!instance_exists(target)) instance_destroy();
else {
	x = target.x;
	y = target.y;

	image_xscale = target.image_xscale;
	image_yscale = target.image_yscale;

	depth = target.depth + 1;
}