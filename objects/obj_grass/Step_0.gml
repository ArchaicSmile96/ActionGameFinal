event_inherited()
if (obj_player.bbox_top == bbox_bottom  && obj_player.bbox_right > bbox_left && obj_player.bbox_left < bbox_right)
{
	obj_player.Die();
}

