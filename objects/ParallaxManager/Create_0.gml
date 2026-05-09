audio_play_sound(snd_Music, 10, true);
globalvar camWidth;
camWidth = camera_get_view_width(view_camera[0]);
globalvar camHeight;
camHeight = camera_get_view_height(view_camera[0]);

far = layer_get_id("Background_1");
near = layer_get_id("Background");

transition = false;
alpha = 0;
