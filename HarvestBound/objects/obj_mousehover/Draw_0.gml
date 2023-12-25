/// @description Insert description here
// You can write your code in this editor

// Draw GUI Event


if (currentobj != noone)
{
	var hovered_tile_x = floor(mouse_x / 16);
	var hovered_tile_y = floor(mouse_y / 16);

	var draw_x = hovered_tile_x * 16;
	var draw_y = hovered_tile_y * 16;

	var spr_width = sprite_get_width(spr_warper)
	var spr_height = sprite_get_height(spr_warper)

	// Calculate scaling factors
	var scale_x = 16 / spr_width;
	var scale_y = 16 / spr_height;

	
	sprHoverColor = 0
	
	if (point_distance(draw_x, draw_y, obj_mainplayer.x, obj_mainplayer.y) > 32)
	{
		sprHoverColor = 1
	}

	switch (hovermode)
	{
		case HoverType.NORMAL:
			draw_sprite(spr_warper, sprHoverColor, mouse_x, mouse_y)
			break
		case HoverType.HOEING:
			draw_sprite(spr_warper, sprHoverColor, mouse_x - sprite_get_width(spr_warper), mouse_y - sprite_get_height(spr_warper))
			break
		case HoverType.PLACEOBJECT:
			if (currentobj.sprite_exists(0))
			{
				spr = object_get_sprite(currentobj)
			// Draw the sprite with scaling
				draw_sprite_ext(spr_warper, sprHoverColor, draw_x, draw_y, scale_x, scale_y, 0, c_white, 1);
				draw_sprite(object_get_sprite(currentobj), 0, draw_x,draw_y)
			}
		
			break
	}


}
