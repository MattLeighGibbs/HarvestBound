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
	instance_create_layer(mouse_x, mouse_y, "Instances", currentobj)
}

if (mouse_wheel_up() and hovermode == HoverType.PLACEOBJECT)
{
	if (currentobjindx == array_length(objs) - 1)
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
		currentobjindx = array_length(objs) - 1
	}
	
	else 
	{
		currentobjindx -= 1
	}
	
	currentobj = objs[currentobjindx]
}
