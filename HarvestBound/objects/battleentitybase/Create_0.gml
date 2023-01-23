/// @description Insert description here
// You can write your code in this editor

hp = 0
atk = 0
def = 0
items = []

function Attack(attacker, attackee) 
{
	xy = 0
	show_debug_message("Attackee HP: " + string(attackee.hp))
	
	resultant_damage = (attacker.atk - attackee.def)
	modifier = resultant_damage * .25
	
	show_debug_message("Damage before modifier: " + string(resultant_damage))
	
	if (random(10) >= 5)
	{
		resultant_damage += modifier
	}
	else 
	{
		resultant_damage -= modifier
	}
	
	resultant_damage = resultant_damage < 0 ? 0 : resultant_damage;
	
	show_debug_message("Damage after modifier: " + string(resultant_damage))
	
	attackee.hp -= resultant_damage
	
	show_debug_message("Attackee HP after being hit: " + string(attackee.hp))
}


