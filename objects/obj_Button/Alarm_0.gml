image_angle = image_angle + irandom_range(-shakeAmount, shakeAmount)

shakeAmount--;

if(shakeAmount <= 0)
{
	shakeAmount = 5;
	image_angle = 0;
}
else
{
	alarm[0] = 1;	
}