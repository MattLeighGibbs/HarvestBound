/// @description Insert description here	
// You can write your code in this editor

var i = 0;

repeat (buttons) {
	draw_set_font(Font1);

	draw_set_color(c_ltgray);
	
	if (menu_index == i) {
		draw_set_color(c_orange);
	}
	
	draw_text(menu_x + button_w * i, menu_y, button[i]);
	i++;
	
	draw_set_color(c_ltgray);
}
draw_set_color(c_white)
draw_text(300, room_height - 200, "Player HP: " + string(plyr.hp) + "/" + string(plyr.maxhp));

draw_text(300, room_height - 100, "Player items: " + string(plyr.items));