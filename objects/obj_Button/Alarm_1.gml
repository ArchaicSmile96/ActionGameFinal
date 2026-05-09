var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

camera_set_view_pos(view_camera[0], 
camX + irandom_range(-shakeAmount, shakeAmount), 
camY + irandom_range(-shakeAmount, shakeAmount));

shakeAmount--;

if(shakeAmount <= 0)
{
	shakeAmount = 5;	
}
else
{
	alarm[1] = 1;	
}