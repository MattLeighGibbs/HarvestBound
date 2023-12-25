/// @description Insert description here
// You can write your code in this editor


switch (hovermode)
{
	case HoverType.NORMAL:
		draw_sprite(spr_warper, 0, mouse_x, mouse_y)
		break
	case HoverType.HOEING:
		draw_sprite(spr_warper, 0, mouse_x - sprite_get_width(spr_warper), mouse_y - sprite_get_height(spr_warper))
		break
	case HoverType.PLACEOBJECT:
		spr = object_get_sprite(currentobj)
		draw_sprite(object_get_sprite(currentobj), 0, mouse_x - sprite_get_width(spr), mouse_y - sprite_get_height(spr))
		break
}