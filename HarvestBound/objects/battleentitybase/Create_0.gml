/// @description Insert description here
// You can write your code in this editor

hp = 0
atk = 0
def = 0
items = []

function Attack(attacker, attackee) 
{
	resultant_damage = (attacker.atk - attackee.def)
	modifier = resultant_damage * .25
	
	if (random(10) >= 5)
	{
		resultant_damage += modifier
	}
	else 
	{
		resultant_damage -= modifier
	}
}


