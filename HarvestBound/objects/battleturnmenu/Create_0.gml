/// @description Insert description here
// You can write your code in this editor

function message_struct(_text, _sound = noone, _shake = false) constructor
{
    text = _text;
    sound = _sound;
	screenShake = _shake
}

function Move(_moveType, _user, _usee = noone) constructor
{
	moveType = _moveType
	user = _user
	usee = _usee
}

global.screenShakeX = 0
global.screenShakeY = 0

plyr = instance_find(PlayableCharacter,0)

_textBox = instance_create_layer(room_width/6, 150, "Text", BattleTextBox)

button[0] = "Bash";
button[1] = "Items";
button[2] = "Magic";
button[3] = "Run";

enum BattleState 
{
	PlayerTurn,
	Action,
	ChooseEnemy,
	Done
}

enum MoveType 
{
	Attack,
	Magic,
	Item,
	Run
}

enemyIndex = 0
moveIndex = 0

currentState = BattleState.PlayerTurn

menu_x = x
menu_y = y
button_w = 250

buttons = array_length_1d(button);

menu_index = 0;

moves = []

// gather all enemies into enemy array
for (var i = 0; i < instance_number(Enemy); ++i;)
{
    enemy[i] = instance_find(Enemy,i);
}


//audio_play_sound(hardenemy, 0, true)

function Attack(attacker, attackee, isPlayer) 
{
	returnMessages = []
	returnMessageIndx = 0
	
	resultant_damage = (attacker.atk - attackee.def)
	modifier = choose(1,2,3,4,5,6,7,8,9,10)
	
	returnMessages[returnMessageIndx] = new message_struct(attacker.name + " " + attacker.attackText)
	
	if (isPlayer)
	{
		returnMessages[returnMessageIndx].sound = startattack_player
	}
	
	else 
	{
		returnMessages[returnMessageIndx].sound = startattack_enemy
	}
	
	returnMessageIndx++
	
	ran = choose(1,2)
	if (ran == 1)
	{
		resultant_damage += modifier
	}
	else 
	{
		resultant_damage -= modifier
	}
	
	resultant_damage = resultant_damage < 0 ? 0 : resultant_damage;

	if (resultant_damage > 0)
	{
		returnMessages[returnMessageIndx] = new message_struct(attacker.name + " hit " + attackee.name + " for " + string(resultant_damage) + " damage")
	
		 		
		global.shakeMod = resultant_damage/2
		returnMessages[returnMessageIndx].screenShake = true
	
		attackee.hp -= resultant_damage
	
		if (isPlayer)
		{
			returnMessages[returnMessageIndx].sound = playerattack
	
			attackee.StartShaking()
	
			if (attackee.hp <= 0)
			{
				returnMessageIndx++
				returnMessages[returnMessageIndx] = new message_struct(attackee.DeathMessage(), enemydie)
			}
		}
		else 
		{   
			alarm[0] = 50
			
			if (attackee.hp > 0)
			{
				returnMessages[returnMessageIndx].sound = enemyattack
			}
			else
			{
				returnMessages[returnMessageIndx].sound = wound
			}
		}

		
		returnMessageIndx++
	}
	
	else 
	{
		returnMessages[returnMessageIndx] = new message_struct("just missed!", attackmiss)
	}

	

	return returnMessages
}

function Run()
{
	result = random_range(1,10)
	_message = []
	
	_message[0] = new message_struct("Tried to get away...")
	
	if (result > 4)
	{
		_message[1] = new message_struct("and did!")
	}
	
	else 
	{
		_message[1] = new message_struct("but couldn't!")
	}
	
	return _message
}

