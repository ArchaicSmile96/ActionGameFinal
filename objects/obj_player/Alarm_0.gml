
var camAng = camera_get_view_angle(view_camera[0])

camera_set_view_angle(view_camera[0], camAng + irandom_range(1, tiltAmount))

tiltAmount--;

if(tiltAmount <= 0)
{
	tiltAmount = 5;	
}
else
{
	alarm[0] = 1;	
}