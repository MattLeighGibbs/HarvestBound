// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_text(_text){
	
	text[page_number] = _text
	
	if (argument_count > 1)
	{
		switch(argument[1])
		{
			case "main":
				speaker_sprite[page_number] = spr_mainchar_frame
				break
			case "cow":
				speaker_sprite[page_number] = spr_cow_frame
				break
			case "frank":
				speaker_sprite[page_number] = Sprite30
				break
			
		}
	}

	
	if (argument_count > 2) 
	{
		speaker_side[page_number] = argument[2]
	}
	
		
	if (argument_count > 3)
	{
		audio_play_sound(argument[3], 1, false)
	}
	
	page_number++
}