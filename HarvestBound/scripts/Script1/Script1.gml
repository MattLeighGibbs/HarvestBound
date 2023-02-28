// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ItemBase() constructor
{
	name = "NULL"
}

function ConsumableBase(_name, 
	_hpRecover,
	_ppRecover,
	_maxHPRecover,
	_maxPPRecover,
	_atkBuf,
	_defBuf) : ItemBase() constructor
{
	name = _name
	hpRecover = _hpRecover
	ppRecover = _ppRecover
	maxHPRecover = _maxHPRecover
	maxPPRecover = _maxPPRecover
	atkBuf = _atkBuf
	defBuf = _defBuf

	function Use(user, usee)
	{
		returnMessages =[]
		if (hpRecover > 0)
		{
			array_push(returnMessages, new message_struct(usee.name + " was healed for " + string(hpRecover) + " HP!"))
		}
				
		if (ppRecover > 0)
		{
			array_push(returnMessages, new message_struct(usee.name + "'s PP was replenished by " + string(ppRecover) + "!"))
		}
				
		if (maxHPRecover > 0)
		{
			array_push(returnMessages, new message_struct(usee.name + "'s HP was increased by " + string(maxHPRecover) + "!"))
		}
				
		if (maxPPRecover > 0)
		{
			array_push(returnMessages, new message_struct(usee.name + "'s PP was increased by " + string(maxPPRecover) + "!"))
		}
				
		if (atkBuf > 0)
		{
			array_push(returnMessages, new message_struct(usee.name + "'s attack was increased by " + string(atkBuf)))
		}
		
		if (defBuf > 0)
		{
			array_push(returnMessages, new message_struct(usee.name + "'s defense was increased by " + string(defBuf)))
		}
	}	
}

function BreadRoll() : ConsumableBase("Bread Roll", 10, 0, 0, 0, 0, 0) constructor 
{}