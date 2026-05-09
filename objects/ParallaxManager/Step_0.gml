var farID = layer_background_get_id(far)
var nearId = layer_background_get_id(near)

var camXScale = camera_get_view_width(view_camera[0])/camWidth
var camYScale = camera_get_view_height(view_camera[0])/camHeight
var xOffset = (sprite_get_width(spr_farBackground) * camXScale - camera_get_view_width(view_camera[0]))/2
var yOffset = (sprite_get_height(spr_farBackground) * camYScale - camera_get_view_height(view_camera[0]))/2

var camX = camera_get_view_x(view_camera[0]) - xOffset;
var camY = camera_get_view_y(view_camera[0]) - yOffset;

yOffset = (sprite_get_height(spr_nearBackground) - camera_get_view_height(view_camera[0]))




layer_background_xscale(nearId, camXScale)
layer_background_yscale(nearId, camYScale)

layer_x(near, camX * 1)
layer_x(far, camX * 0.5)

layer_y(near, camY * 1)