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