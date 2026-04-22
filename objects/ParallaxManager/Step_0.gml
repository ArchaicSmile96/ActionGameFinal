

camX = camera_get_view_x(view_camera[0]) - 50
camY = camera_get_view_y(view_camera[0]) - 162

far = layer_get_id("Background_1");
near = layer_get_id("Background");

layer_x(near, camX * 1)
layer_x(far, camX * 0.5)

layer_y(near, camY * 1)
layer_y(far, camY * 0.5);