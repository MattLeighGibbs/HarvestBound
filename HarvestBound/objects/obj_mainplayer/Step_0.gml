

movex = keyboard_check(ord("D")) - keyboard_check(ord("A"))
movey = keyboard_check(ord("S")) - keyboard_check(ord("W"))

if (!instance_exists(obj_blockable))
{
	
	if (place_meeting(x + movex, y, obj_collision) && !place_meeting(x + movex, y, Enemy))
	{
		movex = 0
	}

	if (place_meeting(x, y + movey, obj_collision) && !place_meeting(x, y + movey, Enemy))
	{
		movey = 0
	}

	x += movex
	y += movey

	currentstopwatch += 1 

	if (keyboard_check(vk_enter) && global.globaltimer <= 0)
	{

		if (!audio_is_playing(sound_dogbark))
		{
		audio_play_sound(sound_dogbark, 1, false)
		}
	
		if ((place_meeting(x + 5, y, obj_cow) and current_sprite == spr_king_right)
			or (place_meeting(x - 5, y, obj_cow) and current_sprite == spr_king_left)
			or (place_meeting(x, y + 5, obj_cow) and current_sprite == spr_king_down)
			or (place_meeting(x, y - 5, obj_cow) and current_sprite == spr_king_up))
			and (!instance_exists(object_textbox))
		{
			with(instance_create_depth(0, 0, -9999, object_textbox))
			{
				scr_game_text("cow")
			}
			
			if (!audio_is_playing(moo))
			{
				audio_play_sound(moo, 1, false)
			}
		}
		
		if ((place_meeting(x + 5, y, Enemy) and current_sprite == spr_king_right)
			or (place_meeting(x - 5, y, Enemy) and current_sprite == spr_king_left)
			or (place_meeting(x, y + 5, Enemy) and current_sprite == spr_king_down)
			or (place_meeting(x, y - 5, Enemy) and current_sprite == spr_king_up))
		{
			
		}
		
		if (place_meeting(x + 5, y, Enemy) and current_sprite == spr_king_right)
		{
			
		}
		
		if (place_meeting(x - 5, y, Enemy) and current_sprite == spr_king_left)
		{
		}
			
		if(place_meeting(x, y + 5, Enemy) and current_sprite == spr_king_down)
		{
		}
		if(place_meeting(x, y - 5, Enemy) and current_sprite == spr_king_up)
		 
		if ((place_meeting(x + 5, y, Object17) and current_sprite == spr_king_right)
			or (place_meeting(x - 5, y, Object17) and current_sprite == spr_king_left)
			or (place_meeting(x, y + 5, Object17) and current_sprite == spr_king_down)
			or (place_meeting(x, y - 5, Object17) and current_sprite == spr_king_up))
		{
			with(instance_create_depth(0, 0, -9999, object_textbox))
			{
				scr_game_text("frank")
			}
		
		}
	}
		
	


	if (keyboard_check(ord("W")))
	{
		current_sprite = spr_king_up
	}
	if (keyboard_check(ord("A")))
	{
		current_sprite = spr_king_left
	}
	if (keyboard_check(ord("S")))
	{
		current_sprite = spr_king_down
	}
	if (keyboard_check(ord("D")))
	{
		current_sprite = spr_king_right
	}
	if (keyboard_check(vk_backspace))
	{
		current_sprite = spr_king_snooz
	}

	if keyboard_check_pressed(vk_anykey)
	{
		currentstopwatch = 0
	}

	if (currentstopwatch >= time_until_idle && current_sprite != spr_king_snooz)
	{
		current_sprite = spr_king_snooz
	}

}

