rotate = false;
storedImageAngle = 0;
upsideDown = false; 
fullyUpsideDown = false;
pivotOffset = 0;
xScaleSign = 1;
function Walk()
{
	sprite_index = spr_playerWalk;
	image_speed = 1;
}

function Idle()
{
	sprite_index = spr_playerIdle;
	image_speed = 1;
}

function Jump()
{
	sprite_index = spr_playerJump;
	image_speed = 0;
	animTimer = 0;
}

function Flip()
{
	image_xscale = -1;
	rotate = true;
	storedImageAngle = image_angle;
}

function Land()
{
	animTimer = 2;
}

function SetXScaleSign(num)
{
	xScaleSign = sign(num);
	image_xscale = sign(num);
}

animTimer = -1;
animSpeed = 0.05;
squeeze = animcurve_get_channel(AnimationCurve1, "squeeze")
stretch = animcurve_get_channel(AnimationCurve1, "stretch")
