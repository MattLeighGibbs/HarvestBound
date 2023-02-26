/// @description Insert description here
// You can write your code in this editor

function ItemBase() constructor
{
	name = "NULL"
}

function ConsumableBase(_name, 
	_hpRecover,
	_mpRecover,
	_atkBuf,
	_defBuf) : ItemBase() constructor
{
	name = _name
	hpRecover = _hpRecover
	mpRecover = _mpRecover
	atkBuf = _atkBuf
	defBuf = _defBuf
}

function BreadRoll() : ConsumableBase("Bread Roll, 10, 0, 0") constructor 
{}