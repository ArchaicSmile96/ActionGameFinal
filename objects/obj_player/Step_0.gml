Invert();

xVel = 0;
OrientandWalk()

CheckState()

AnimateJump()

CapVelocity()

CheckFell();


x += xVel * spd;
y += yVel;

var cwidth = camera_get_view_width(view_camera[0]);
var cheight = camera_get_view_height(view_camera[0]);

// lerps the camera
var X = lerp(camera_get_view_x(view_camera[0]), x-cwidth/2, 0.2);
var Y = lerp(camera_get_view_y(view_camera[0]), y-cheight/2, 0.2);

if (point_distance(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), x-cwidth/2, y-cheight/2) != 0)
{
	camera_set_view_pos(view_camera[0],X, Y);
}