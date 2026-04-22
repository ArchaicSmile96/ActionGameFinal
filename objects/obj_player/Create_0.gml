enum PlayerState
{
	Grounded,
	Jumping,
	Falling
}

globalvar token;
token = [];
globalvar dict;
dict = ds_map_create()
ds_map_add(dict, 0, [-50, 0])
visual = obj_playerVisual;
spd = 2;
xVel = 0;
xAccel = 0.2;
yVel = 0;
grav = 0.2;
isGrounded = false;
isJumping = false;
timer = 1;
state = PlayerState.Falling;
HP = 10;
jumpedTwice = false;
jumpVel = -4;
leftKey = ord("A");
rightKey = ord("D");
upsideDown = false;
pressedSpace = false;
shakeAmount = 5;
function Hurt()
{
	HP--;
	hasIFrames = true;
}

function Flip()
{
	audio_play_sound(snd_Flip, 10, false);
	state = PlayerState.Falling;
	grav = -grav;
	jumpVel = -jumpVel;
	jumpedTwice = true;
	upsideDown = !upsideDown;
}

function Invert()
{
	if (!jumpedTwice)
	{
		if (pressedSpace || state = 2)
		{
			if (keyboard_check_pressed(vk_space))
			{
				Flip()
				alarm[0] = 3;
				visual.Flip()
			}
		}
	}
}

function OrientandWalk()
{
	if (!upsideDown)
	{
		if (keyboard_check(leftKey))
		{
			visual.image_xscale = -1;
			xVel = -1;
		}
		if (keyboard_check(rightKey))
		{
			visual.image_xscale = 1;
			xVel = 1;
		}
	}
	else
	{
		if (keyboard_check(leftKey))
		{
			visual.image_xscale = 1;
			xVel = -1;
		}
		if (keyboard_check(rightKey))
		{
			visual.image_xscale = -1;
			xVel = 1;
		}
	}

	if (state == PlayerState.Grounded)
	{
		if (xVel != 0)
		{
			visual.Walk();
		}
		else 
		{
			visual.Idle();
		}
	}
}

function CheckState()
{
	switch (state)
	{
		case PlayerState.Grounded:
		    pressedSpace = false;
			jumpedTwice = false;
			if (keyboard_check_pressed(vk_space))
			{
				audio_play_sound(snd_Jump, 10, false)
				state = PlayerState.Jumping;
				yVel = jumpVel;
				timer = 3;
				isJumping = true;
				visual.Jump()
				visual.image_index = 0;
			}
			if !(upsideDown)
			{
				if (!place_meeting(x, bbox_bottom + 1, obj_ground))
				{
					visual.Jump();
					state = PlayerState.Falling;
				}
			}
			else
			{
				if (!place_meeting(x, bbox_top - 1, obj_ground))
				{
					visual.Jump()
					state = PlayerState.Falling;
				}
			}
			break;
		case PlayerState.Falling:
			yVel += grav;
			break;
		case PlayerState.Jumping:
			if (keyboard_check_released(vk_space))
			{
				isJumping = false;
				pressedSpace = true;
			}
		
			if (isJumping)
			{
				yVel += grav/2;
			}
			else
			{
				yVel += grav;
			}
		
			timer -= delta_time/100000
			if (timer <= 0)
			{
				isJumping = false;
				timer = 1;
			}
		
			if (!upsideDown)
			{
				if (yVel > 0)
				{
					state = PlayerState.Falling;
					timer = 1;
				}
			}
			else
			{
				if (yVel < 0)
				{
					state = PlayerState.Falling;
					timer = 1;
				}
			}
			break;
	}
}

function AnimateJump()
{
	if (yVel > -1.25 && yVel < 1.25 && yVel != 0)
	{
		visual.image_index = 1;
	}
	else if (yVel > 1.25 && !upsideDown)
	{
		visual.image_index = 2;
	}
	else if (yVel < -1.25 && upsideDown)
	{
		visual.image_index = 2;
	}
}

function CapVelocity()
{
	if (xVel > 5)
	{
		xVel = 5;
	}
	if (yVel > 10)
	{
		yVel = 10;
	}
	if (yVel < -10)
	{
		yVel = -10;
	}
}

function CheckFell()
{
	if (y > room_height || y < 0)
	{
		if (upsideDown)
		{
			Flip()
			yVel = 0;
		}
		audio_play_sound(snd_Die, 10, false)
		visual.rotate = false;
		visual.image_angle = 0;
		x = 48
		y = 608
	}
}