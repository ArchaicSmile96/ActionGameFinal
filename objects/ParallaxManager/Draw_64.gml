
if (transition)
{
	alpha += 0.005;
	draw_sprite_stretched_ext(spr_fade, 0, 0, 0, display_get_gui_width() , display_get_gui_height(), c_white, alpha)
	if (alpha >= 1)
	{
		room_goto_previous();
	}
}