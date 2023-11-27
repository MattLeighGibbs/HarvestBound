/// @description Insert description here
// You can write your code in this editor


if (currentState == BattleState.ChooseEnemy)
{
	enemymenu_move = keyboard_check(ord("D")) - keyboard_check_pressed(ord("A"));

	if (enemymenu_move != 0)
	{
		audio_play_sound(cursorhoriz, 1, false)
	}

	oldEnemyIndex = enemyIndex
	enemyIndex += enemymenu_move;

	enemyIndex = enemyIndex < 0 ? array_length_1d(global.enemy) - 1 : enemyIndex;
	enemyIndex = enemyIndex > array_length_1d(global.enemy) - 1 ? 0 : enemyIndex;
	
	if (oldEnemyIndex != enemyIndex)
	{
		global.enemy[oldEnemyIndex].StopFlashing()
	}
	
	else if (!global.enemy[oldEnemyIndex].shouldFlash)
	{
		global.enemy[enemyIndex].StartFlashing()
	}
	
	if (keyboard_check_released(vk_enter))
	{
		audio_play_sound(cursorhoriz, 0, false)
		global.enemy[enemyIndex].StopFlashing()
	
		moves[moveIndex++] = new Move(MoveType.Attack, plyr, global.enemy[enemyIndex])
						
		currentState = BattleState.Action
	}
	else if (keyboard_check_released(vk_backspace))
	{
		global.enemy[enemyIndex].StopFlashing()
		currentState = BattleState.PlayerTurn
	}
}

else if (currentState == BattleState.PlayerTurn && !_textBox.showText)
{
	menu_move = keyboard_check(ord("D")) - keyboard_check_pressed(ord("A"));

	if (menu_move != 0)
	{
		audio_play_sound(cursorhoriz, 1, false)
	}

	menu_index += menu_move;

	menu_index = menu_index < 0 ? buttons - 1 : menu_index;
	menu_index = menu_index > buttons - 1 ? 0 : menu_index;

	
	if (keyboard_check_released(vk_enter))
	{
		
		switch (menu_index) 
		{
			case 0:
				currentState = BattleState.ChooseEnemy
				break;
			case 1: 
				_textBox.text[0] = new message_struct("ITEM");
				break;
			case 2:
				_textBox.text[0] = new message_struct("MAGIC");
				break;
			case 3: 
				moves[moveIndex++] = new Move(MoveType.Run, plyr)
				currentState = BattleState.Action
				break;
		}	
	}
}


else if (currentState == BattleState.Action && !_textBox.showText)
{
	ranaway = false
	for (i = 0; i < array_length_1d(global.enemy); i++)
	{
		moves[moveIndex] = new Move(MoveType.Attack, global.enemy[i], plyr)
		moveIndex++
	}
	
	for (i = 0; i < array_length_1d(moves); i++)
	{
		move = moves[i]
		if (move.user.hp <= 0)
		{
			continue	
		}
		res = []
		
		if (move.moveType == MoveType.Attack)
		{
			if (move.user.isPlayer)
			{
				res = Attack(move.user, move.usee, move.user.isPlayer)
			}
			else 
			{
				res = Attack(move.user, plyr, false)
			}
			
			if (array_length_1d(res) > 2)
			{
				array_push(_textBox.text, res[0], res[1], res[2])
			}
			else 
			{
				array_push(_textBox.text, res[0], res[1])
			}
		}
		else if (move.moveType == MoveType.Run)
		{
			res = Run()
			array_push(_textBox.text, res[0], res[1])
			
			if (res[1].text = "and did!")
			{
				ranaway = true
			}
		}
		
	}
	
	battleOver = true
	for (i = 0; i < array_length_1d(global.enemy); i++)
	{
		if (global.enemy[i].hp > 0)
		{
			battleOver = false
			break;
		}
	}
	
	if (plyr.hp <= 0 || ranaway)
	{
		battleOver = true
	}
		
	if (battleOver)
	{
		currentState = BattleState.Done
		
		if (ranaway)
		{
			room_goto(global.lastroom)
			global.enemy = []
			instance_destroy(self)
		}
		else if (plyr.hp > 0)
		{			
			array_push(_textBox.text,new message_struct("YOU WON!", stdBattleWon, false, true))
			totalXP = 0
			for (i = 0; i < array_length_1d(global.enemy); i++)
			{
				if (global.enemy[i].item != noone)
				{
					array_push(_textBox.text,new message_struct("The enemy dropped a present!"))
					array_push(_textBox.text,new message_struct("inside the present was a " + global.enemy[i].item.name + "!", present))
					array_push(_textBox.text,new message_struct(plyr.name + " takes it", itemget))
					array_push(plyr.items, global.enemy[i].item)
				}
				
				//totalXP += enemy.expDrop
			}
			
			
			// FOR WHEN THERE ARE MULTIPLE PARTY MEMBERS
			//plyr.ApplyXP(totalXP / global.partySize
			
			//plyr.ApplyXP(totalXP)
		}
		
		else 
		{
			array_push(_textBox.text,new message_struct("YOU LOST", battleLost, false, true))
		}
	}
		
	else 
	{
		currentState = BattleState.PlayerTurn
	}
	
	moves = []
	moveIndex = 0

}

else if (currentState == BattleState.Done && !_textBox.showText)
{
	if (plyr.hp <= 0)
	{
		room_goto(udied)
	}
	else 
	{
		plyr.current_sprite =  plyr.overworld_sprite
		room_goto(global.lastroom)
	}
	
	global.enemy = []
	
	instance_destroy(self)
}
