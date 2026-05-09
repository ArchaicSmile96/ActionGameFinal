sprite_set_offset(sprite_index, 16, 48)
if (!rotate)
{
	y = obj_player.y;
}
if (fullyUpsideDown & !rotate)
{
	y = obj_player.bbox_top;
}

x = obj_player.x;

upsideDown = obj_player.upsideDown;


if (rotate)
{
	var target = storedImageAngle + 180;
	var rotationLerp = lerp(image_angle, target, 0.12)

	if (upsideDown)
	{
		y = lerp(y, obj_player.bbox_top + 24, 0.9);
	}
	else
	{
		y = lerp(y, obj_player.y - 24, 0.9);
	}
	
	
	sprite_set_offset(sprite_index, 16, 24)
	
	image_angle = rotationLerp;
	
	if (target - image_angle < 1)
	{
		image_angle = target;
		storedImageAngle = image_angle;
		rotate = false;
		fullyUpsideDown = !fullyUpsideDown;
		pivotOffset = 0;
	}
}


if (animTimer >= 0 && animTimer < 2)
{
	animTimer += animSpeed;
	image_yscale = animcurve_channel_evaluate(stretch, animTimer);
	image_xscale = animcurve_channel_evaluate(squeeze, animTimer) * xScaleSign;
	
	if (animTimer >= 1)
	{
		image_xscale = xScaleSign;
		image_yscale = 1;
		animTimer = -1;
	}
}
if (animTimer >= 2)
{
	animTimer += animSpeed;
	image_xscale = animcurve_channel_evaluate(stretch, animTimer - 2) * xScaleSign;
	image_yscale = animcurve_channel_evaluate(squeeze, animTimer - 2);

	if (animTimer >= 3)
	{
		image_xscale = xScaleSign;
		image_yscale = 1;
		animTimer = -1;
	}
}



