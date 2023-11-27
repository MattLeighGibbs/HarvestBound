/// @description Insert description here
// You can write your code in this editor


switch (hovermode)
{
	case HoverType.NORMAL:
		draw_sprite(spr_warper, 0, mouse_x, mouse_y)
		break
	case HoverType.HOEING:
		draw_sprite(spr_warper, 0, mouse_x, mouse_y)
		break
	case HoverType.PLACEOBJECT:
		draw_sprite(object_get_sprite(currentobj), 0, mouse_x, mouse_y)
		break
}