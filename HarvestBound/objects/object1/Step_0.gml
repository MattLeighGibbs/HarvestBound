/// @description Insert description here
// You can write your code in this editor

menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

menu_index += menu_move;

menu_index = menu_index < 0 ? buttons - 1 : menu_index;
menu_index = menu_index > buttons - 1 ? 0 : menu_index;

