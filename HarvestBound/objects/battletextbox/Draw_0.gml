/// @description Insert description here
// You can write your code in this editor

// draw textbox

draw_sprite(spr_battletextbox, 0, x, y)


// draw text

draw_text_ext(x + (boxWidth * .1), y + (sprite_get_height(BattleTextBox) * .1), text, stringHeight, boxWidth - (boxWidth * .1))


