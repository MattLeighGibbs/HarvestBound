/// @description Insert description here
// You can write your code in this editor

if (room != Room1 && room != udied)
{
	global.lastroom = room
	
	room_goto(Room1)
	
	if (instance_exists(obj_battle))
	{
		show_debug_message("HELLO")
	}
	
	global.enemy = [other.id]

	current_sprite = noone
	
	other.id.current_sprite = other.id.battle_sprite
}

x += 5
y += 5