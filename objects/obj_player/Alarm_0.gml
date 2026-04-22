var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);
var camAng = camera_get_view_angle(view_camera[0])

camera_set_view_angle(view_camera[0], camAng + irandom_range(1, shakeAmount))

shakeAmount--;

if(shakeAmount <= 0)
{
	shakeAmount = 5;	
}
else
{
	alarm[0] = 1;	
}