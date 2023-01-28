/// @description Insert description here
// You can write your code in this editor

_textBox = noone

button[0] = "Bash";
button[1] = "Items";
button[2] = "Magic";
button[3] = "Run";

currentText = ""

menu_x = x
menu_y = y
button_w = 150

buttons = array_length_1d(button);

menu_index = 0;
last_selected = 0;

battle_is_over = false

// gather all enemies into enemy array
for (var i = 0; i < instance_number(obj_frank); ++i;)
{
    enemy[i] = instance_find(obj_frank,i);
}

