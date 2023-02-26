/// @description Insert description here
// You can write your code in this editor


if (currentState == BattleState.ChooseEnemy)
{
	enemymenu_move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

	if (enemymenu_move != 0)
	{
		audio_play_sound(cursorhoriz, 1, false)
	}

	oldEnemyIndex = enemyIndex
	enemyIndex += enemymenu_move;

	enemyIndex = enemyIndex < 0 ? array_length_1d(enemy) - 1 : enemyIndex;
	enemyIndex = enemyIndex > array_length_1d(enemy) - 1 ? 0 : enemyIndex;
	
	if (oldEnemyIndex != enemyIndex)
	{
		enemy[oldEnemyIndex].StopFlashing()
	}
	
	else if (!enemy[oldEnemyIndex].shouldFlash)
	{
		enemy[enemyIndex].StartFlashing()
	}
	
	if (keyboard_check_released(vk_enter))
	{
		audio_play_sound(cursorhoriz, 0, false)
		enemy[enemyIndex].StopFlashing()
	
		moves[moveIndex++] = new Move(MoveType.Attack, plyr, enemy[enemyIndex])
						
		currentState = BattleState.Action
	}
	else if (keyboard_check_released(vk_backspace))
	{
		enemy[enemyIndex].StopFlashing()
		currentState = BattleState.PlayerTurn
	}
}

else if (currentState == BattleState.PlayerTurn && !_textBox.showText)
{
	menu_move = keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);

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
	for (i = 0; i < array_length_1d(enemy); i++)
	{
		moves[moveIndex] = new Move(MoveType.Attack, enemy[i], plyr)
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
		}
		
	}
	
	
	battleOver = true
	for (i = 0; i < array_length_1d(enemy); i++)
	{
		if (enemy[i].hp > 0)
		{
			battleOver = false
			break;
		}
	}
	
	if (plyr.hp <= 0)
	{
		battleOver = true
	}
		
	if (battleOver)
	{
		currentState = BattleState.Done
		_textBox.stayOnScreen = true
		
		if (plyr.hp > 0)
		{
			array_push(_textBox.text,new message_struct("YOU WON!", stdBattleWon))
		}
		
		else 
		{
			array_push(_textBox.text,new message_struct("YOU LOST", battleLost))
		}
	}
		
	else 
	{
		currentState = BattleState.PlayerTurn
	}
	
	moves = []
	moveIndex = 0

}


