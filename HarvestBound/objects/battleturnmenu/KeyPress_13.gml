/// @description Insert description here
// You can write your code in this editor

switch (menu_index) {
	case 0:
		show_debug_message("BASH");
		plyr = instance_find(PlayableCharacter,0);
		currEnemy = enemy[0]
		plyr.Attack(plyr, currEnemy)
		break;
	case 1: 
		show_debug_message("ITEM");
		break;
	case 2:
		show_debug_message("MAGIC");
		break;
	case 3: 
		show_debug_message("RUN");
		break;
}