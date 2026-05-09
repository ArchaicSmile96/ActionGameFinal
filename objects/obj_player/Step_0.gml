Invert();

xVel = 0;
OrientandWalk()

CheckState()

AnimateJump()

CapVelocity()

CheckFell();

if (afterImageEffect)
{
	afterImageInterval--;
	if (afterImageInterval <= 0)
	{
		var afterImage = instance_create_layer(visual.x, visual.y, "Instances", obj_afterImage)
		afterImage.sprite_index = afterImageMap[? visual.sprite_index];
		if (visual.rotate)
		{
			sprite_set_offset(afterImage.sprite_index, 16, 24)
			afterImageInterval = 7;
		}
		else
		{
			sprite_set_offset(afterImage.sprite_index, 16, 48)
			afterImageInterval = 5;
		}
		afterImage.image_index = visual.image_index;
		afterImage.image_angle = visual.image_angle;
		afterImage.image_xscale = visual.image_xscale;
		afterImage.image_yscale = visual.image_yscale;
		
		
	}
}

x += xVel * spd;
y += yVel;

var cwidth = camera_get_view_width(view_camera[0]);
var cheight = camera_get_view_height(view_camera[0]);

// lerps the camera
var X = lerp(camera_get_view_x(view_camera[0]), x-cwidth/2, 0.2);
var Y = lerp(camera_get_view_y(view_camera[0]), (y - sprite_height/2) -cheight/2, 0.2);

if (point_distance(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), x-cwidth/2, (y - sprite_width/2)-cheight/2) != 0)
{
	if (y > room_height - cheight/2|| y < -50 + cheight/2)
	{
		Y = camera_get_view_y(view_camera[0]);
	}
	camera_set_view_pos(view_camera[0],X, Y);
}

if (keyboard_check(vk_shift))
{
	var newWidth = lerp(cwidth, camWidth * 1.25, 0.1)
	var newHeight = lerp(cheight, camHeight * 1.25, 0.1)
	if (camera_get_view_width(view_camera[0]) != camWidth * 1.25)
	{
		camera_set_view_size(view_camera[0], newWidth, newHeight)
	}
}
else
{
	var newWidth = lerp(cwidth, camWidth, 0.1)
	var newHeight = lerp(cheight, camHeight, 0.1)
	if (camera_get_view_width(view_camera[0]) != camWidth)
	{
		camera_set_view_size(view_camera[0], newWidth, newHeight)
	}
}
