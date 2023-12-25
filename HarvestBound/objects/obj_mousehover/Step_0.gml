/// @description Insert description here
// You can write your code in this editor


if (keyboard_check(ord("H")))
{
	hovermode = HoverType.HOEING
}

if (keyboard_check(ord("N")))
{
	hovermode = HoverType.NORMAL
}	
	
if (keyboard_check(ord("P")))
{
	currentobj = obj_house
	hovermode = HoverType.PLACEOBJECT
}

if (mouse_check_button_pressed(mb_left) and hovermode == HoverType.PLACEOBJECT)
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


	spr = object_get_sprite(currentobj)
	instance_create_layer(draw_x, draw_y, "Instances", currentobj)
}

if (mouse_wheel_up() and hovermode == HoverType.PLACEOBJECT)
{
	if (currentobjindx == 7)
	{
		currentobjindx = 0
	}
	
	else 
	{
		currentobjindx += 1
	}
	
	currentobj = objs[currentobjindx]
}

if (mouse_wheel_down() and hovermode == HoverType.PLACEOBJECT)
{
	if (currentobjindx == 0)
	{
		currentobjindx = 7
	}
	
	else 
	{
		currentobjindx -= 1
	}
	
	currentobj = objs[currentobjindx]
}
