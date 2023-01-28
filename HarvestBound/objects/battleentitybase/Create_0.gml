/// @description Insert description here
// You can write your code in this editor

hp = 0
atk = 0
def = 0
items = []
name = ""

function Attack(attacker, attackee) 
{
	returnString = "" 
	
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
	
	resultant_damage = resultant_damage < 0 ? 0 : resultant_damage;

	returnString += attacker.name + " hit " + attackee.name + " for " + string(resultant_damage) + " damage"

	attackee.hp -= resultant_damage
	
	if (attackee.hp <= 0)
	{
		instance_destroy(attackee)
	}

	return returnString
}



