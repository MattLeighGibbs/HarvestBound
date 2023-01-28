/// @description Insert description here
// You can write your code in this editor

if (_textBox == noone)
{
	_textBox = instance_create_layer(room_width/4, room_height/4, "Text", BattleTextBox)
}

switch (menu_index) {
	case 0:
		show_debug_message("BASH");
		plyr = instance_find(PlayableCharacter,0);
		currEnemy = enemy[0]
		_textBox.text = plyr.Attack(plyr, currEnemy)
		break;
	case 1: 
		_textBox.text = "ITEM";
		break;
	case 2:
		_textBox.text = "MAGIC";
		break;
	case 3: 
		_textBox.text = "RUN";
		break;
}

alarm[0] = 75