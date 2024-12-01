/// @description Inserir descrição aqui
if (!instance_exists(target)) instance_destroy();
else {
	depth = target.depth - 1;
	x = lerp(x, target.x + 7 * image_xscale, 0.35);
	y = lerp(y, target.y - 3 * image_yscale, 0.35);
	
	if (!attacking){
		image_xscale = target.image_xscale/1.5;
		image_yscale = target.image_yscale/1.5;
		image_angle = lerp(image_angle, target.image_angle, 0.1);
	} else {
		var _angle = 1;
		if (sign(image_xscale) != 0 && sign(image_xscale) > 0) _angle = -1;
		else _angle = 1;
		dmg = (dmg_normal * lvl) + target.dmg;
		image_angle = (_angle) * lerp(abs(image_angle), 180, 0.3);
		if (image_angle >= 175 || image_angle <= -175) {
			attacking = false;
		}
	}
}

