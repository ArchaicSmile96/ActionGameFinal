rotate = false;
storedImageAngle = 0;
upsideDown = false; 
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
}

function Flip()
{
	image_xscale = -1;
	rotate = true;
	storedImageAngle = image_angle;
}