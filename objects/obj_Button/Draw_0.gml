draw_self();
draw_set_font(Font3);
draw_set_colour(c_black);
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var sizeXPercent = image_xscale/xScale
var sizeYPercent = image_yscale/yScale
var sizePercent = 0;
if(sizeXPercent > sizeYPercent)
{
	sizePercent = sizeYPercent
}
else
{
	sizePercent = sizeXPercent
}
if (clicked)
{
	sizePercent = (image_xscale)/xScale;
}
draw_text_transformed(x, y, buttonString, sizePercent, sizePercent, image_angle)


