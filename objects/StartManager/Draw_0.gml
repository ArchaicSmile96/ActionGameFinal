timer--
if (timer <= 0)
{
	timer = 60;
	draw = !draw;
}
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_colour(c_white)
draw_set_font(Font1)
draw_text(room_width/2, room_height/3, "The Beginning")

if (draw)
{
	draw_text_ext_transformed(room_width/2, room_height/2, "click to start", 0, -1, 0.5, 0.5, 0)
}
