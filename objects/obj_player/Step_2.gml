
if (place_meeting(x, y, obj_ground)) {
var new_x = x;
for(var dist_moved = 0; dist_moved < spd; dist_moved++){
	new_x -= sign(xVel);
	if (!place_meeting(new_x, y, obj_ground)) {
		x = round(new_x);
		xVel = 0;
		break;
	}
}
}
if (place_meeting(x, y, obj_ground)) {
	var new_y = y;
if (!upsideDown)
{
	new_y = ceil(y);
}
else
{
	new_y = round(y);
}
for(var dist_moved = 0; dist_moved < abs(yVel) + 5; dist_moved++){
	new_y -= sign(yVel);
	if (!place_meeting(x, new_y, obj_ground)) 
	{
		if (!upsideDown)
		{
			if (yVel > 0)
			{
				if (yVel >= 7.5)
				{
					alarm[1] = 1;
				}

				afterImageEffect = false;
				visual.Land();
				state = PlayerState.Grounded;
				jumpedTwice = false;
				squishTimer = 0;
				part_particles_create(particleSystem, x, new_y, 0, 1)
			}
			else if (yVel < 0)
			{
				visual.Jump();
				state = PlayerState.Falling;
			}
			yVel = 0;
			y = new_y

		}
		else
		{
			if (yVel <= 0)
			{
				if (yVel <= -7.5)
				{
					alarm[1] = 1;
				}
				afterImageEffect = false;
				state = PlayerState.Grounded;
				visual.Land();
				jumpedTwice = false;
				squishTimer = 0;
				part_particles_create(particleSystem, x, new_y - sprite_height + 6, 1, 1)
			}
			else if (yVel > 0)
			{
				visual.Jump();
				state = PlayerState.Falling;
			}
			yVel = 0;
			y = new_y;
		}
	}
}
}
