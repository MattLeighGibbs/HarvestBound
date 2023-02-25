/// @description Insert description here
// You can write your code in this editor

if (hp > 0 && shouldFlash && !alreadyFlashing)
{
	alarm[2] = 1
	alreadyFlashing = true
}

if (hp <= 0 && !alreadyFading)
{
	alarm[1] = 210
	alreadyFading = true
}