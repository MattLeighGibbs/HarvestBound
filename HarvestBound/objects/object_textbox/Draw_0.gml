/// @description Insert description here
// You can write your code in this editor

accept_key = keyboard_check_pressed(vk_enter)

textbox_x = camera_get_view_x(view_camera[0])
textbox_y = camera_get_view_y(view_camera[0]) + 144

if (!setup)
{
	setup = true
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
	
	page_number = array_length(text)
	
	for (var p = 0; p < page_number; p++)
	{
		text_length[p] = string_length(text[p])
		
		
		// this is for no character , centering textbox 
		text_x_offset[p] = 44
	}
}

// typing text 

if (draw_char < text_length[page])
{
	draw_char += text_speed
	draw_char = clamp(draw_char, 0, text_length[page])
}

// flip thru pages 

if (accept_key)
{
	// if typing is done, go to next page
	if (draw_char == text_length[page])
	{
		if (page < page_number - 1)
		{
			page++
			draw_char = 0
		}
		else 
		{
			instance_destroy()
		}
	}
	else 
	{
		draw_char = text_length[page]	
	}
}

txtb_spr_w = sprite_get_width(spr_textbox)
txtb_spr_h = sprite_get_height(spr_textbox)

draw_sprite_ext(spr_textbox, 0, textbox_x + text_x_offset[page], textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1) 

// draw the text 

draw_set_font (Font2) 

var _drawtext = string_copy(text[page], 1, draw_char)
draw_text_ext(textbox_x + text_x_offset[page] + border, textbox_y + border, _drawtext, line_sep, line_width)