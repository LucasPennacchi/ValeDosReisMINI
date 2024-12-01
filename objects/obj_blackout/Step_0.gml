/// @description Slow fade

if (variable_global_exists("pause")){
	if (global.pause){
		image_speed = 0;
		exit;
	}
}

if (alpha < .99) alpha = lerp(alpha, 1, .05);
else instance_destroy();