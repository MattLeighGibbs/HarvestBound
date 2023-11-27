/// @description Insert description here
// You can write your code in this editor


textbox_width = 150
textbox_height = 64

frame_width = 64
frame_height = 64

border = 8
line_sep = 12
line_width = textbox_width - border*2

textb_spr = spr_textbox
textb_img = 0
textb_img_spd = 0

page = 0
page_number = 0 

text[0] = "You sure are a scruffy dog! Are you living over there with mary and jim ?"
text[1] = "jim ?"
text[2] = "You sure areeeeeeee yes yes yes yes "
text[3] = " a scruffy dog! Are you living over there with mary and jim ?"
text[4] = "You sure Are you living over there with mary and jim ?"

text_length[0] = string_length(text[0])

speaker_sprite[page_number] = noone
speaker_side[page_number] = 1 

draw_char = 0
text_speed = 1

setup = false

depth = -9999