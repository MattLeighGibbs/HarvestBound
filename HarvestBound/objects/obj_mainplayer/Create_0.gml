/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

hp = 5
maxhp = 1002
atk = 5
def = 10

name = "The Hero"

spells = []

isPlayer = true

movex = 0
movey = 0

movespd = 5

overworld_sprite = spr_king_left
current_sprite = spr_king_left

time_until_idle = 1000
currentstopwatch = 0

function GetClosestGuyImPointingAt()
{
	toright = (place_meeting(x + 5, y, InteractableBase) and current_sprite == spr_king_right)
	toleft = (place_meeting(x - 5, y, InteractableBase) and current_sprite == spr_king_left)
	todown = (place_meeting(x, y + 5, InteractableBase) and current_sprite == spr_king_down)
	toup = (place_meeting(x, y - 5, InteractableBase) and current_sprite == spr_king_up)

	returnval = noone

	if (toright)
	{
		returnval = collision_line(x, y, x + 5, y, InteractableBase, false, false)
	}
	if (toleft)
	{ 
		returnval = collision_line(x, y, x - 5, y, InteractableBase, false, false)
	}
	if (toup)
	{
		returnval = collision_line(x, y, x, y - 5, InteractableBase, false, false)
	}
	if (todown)
	{
		returnval = collision_line(x, y, x, y + 5, InteractableBase, false, false)
	}
	
	return returnval
}	