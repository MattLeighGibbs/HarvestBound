/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

if (!instance_exists(obj_battle) || (instance_exists(obj_battle) && inBattle))
{
	event_inherited();
}