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
shouldShake = false
alreadyShaking = false

inBattle = false

shakeX = 0
shakeY = 0

rootX = x
rootY = y

origspd = 1
spd = 1

battle_sprite = noone 
overworld_sprite = noone
dead_sprite = noone 

battle_on_touch = false

persistent = true

lastx = x
lasty = y

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
function StartShaking()
{
	shouldShake = true
}
function StopShaking()
{
	shouldShake = false
	alreadyShaking = false
	x = rootX 
	y = rootY
}

