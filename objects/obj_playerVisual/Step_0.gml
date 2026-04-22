x = obj_player.x;
y = obj_player.y;
upsideDown = obj_player.upsideDown;

if (upsideDown)
{
	y += 6;
}
if (rotate)
{
	var target = storedImageAngle + 180;
	var rotationLerp = lerp(image_angle, target, 0.1)
	image_angle = rotationLerp;
	if (target - image_angle < 1)
	{
		image_angle = target;
		storedImageAngle = 0;
		rotate = false;
	}
}

