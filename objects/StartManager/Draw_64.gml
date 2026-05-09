
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_white)
draw_set_font(Font1)
draw_text(display_get_gui_width()/2,display_get_gui_height()/3, "ASTRID")


if (transition)
{
	alpha += 0.05;
	draw_sprite_stretched_ext(spr_fade, 0, 0, 0, display_get_gui_width() , display_get_gui_height(), c_white, alpha)
	if (alpha >= 1)
	{
		room_goto_next();
	}
}