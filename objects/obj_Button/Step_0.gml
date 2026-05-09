if (beginHover)
{
	var lerpScale = lerp(image_xscale, xScale + sizeOffset, 0.25)
	image_xscale = lerpScale;
	image_yscale = lerpScale;
	if (image_xscale >= xScale + sizeOffset - 0.05)
	{
		image_xscale = xScale + sizeOffset;
		image_yscale = yScale + sizeOffset;
		beginHover = false;
	}
}

if(endHover)
{
	var lerpScale = lerp(image_xscale, xScale, 0.25)
	image_xscale = lerpScale;
	image_yscale = lerpScale;
	if (image_xscale <= xScale + 0.05)
	{
		image_xscale = xScale;
		image_yscale = yScale;
		endHover = false;
	}
}

if(hover)
{
	if (mouse_check_button_pressed(mb_left))
	{
		alarm[1] = 1;
		audio_play_sound(snd_Land, 10, false)
		clicked = true;
		storedImageAngle = image_angle;
	}
}

if (clicked)
{
	var target = storedImageAngle + 180;
	var rotationLerp = lerp(image_angle, target, 0.12)
	yVel += yAccel;
	y -= yVel;
	image_angle = rotationLerp

	if (y - sprite_height * 2 < 0 || y  + sprite_height * 2 > room_height)
	{
		if (buttonString == "Quit")
		{
			game_end();
		}
		StartManager.transition = true;
	}
}

