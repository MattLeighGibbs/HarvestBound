/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

item = noone

hp = 10
atk = 5
def = 5 
name = "YOU SHOULDNT SEE THIS"

expDrop = 0

deathMessage = "was defeated!"

alreadyFading = false
alreadyFlashing = false
shouldFlash = false

function DeathMessage()
{
	return name + " " + deathMessage
}

function StartFlashing()
{
	shouldFlash = true
}
function StopFlashing() 
{
	shouldFlash = false
	alreadyFlashing = false
	if (hp > 0)
	{
		image_alpha = 1
	}
}