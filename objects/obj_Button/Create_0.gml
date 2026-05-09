beginHover = false;
endHover = false;
shakeAmount = 3;
hover = false;
clicked = false;

xScale = image_xscale;
yScale = image_yscale;
sizeOffset = 0.5;
shakeAmount = 5;
randomize();
if (irandom_range(0, 1))
{
	yAccel = 0.2;
}
else
{
	yAccel = -0.2;
}


storedImageAngle = 0;

yVel = 0;
