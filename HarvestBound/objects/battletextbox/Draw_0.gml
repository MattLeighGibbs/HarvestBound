/// @description Insert description here
// You can write your code in this editor

// draw textbox
// draw text

drawx = x 
drawy = y 

if (showText)
{
	if (image_xscale < 1.4)
	{
		image_xscale += .05
	}
	
	shakeX = 0
	shakeY = 0
	
	if (global.okToShake)
	{
		shakeX = random_range(0,5 * global.shakeMod)
		shakeY = random_range(0,5 * global.shakeMod)
	}
	
	draw_sprite_ext(spr_battletextbox, 0,x + shakeX,y + shakeY,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
	draw_text_ext(drawx + shakeX + BUFFER, drawy + shakeY + BUFFER, text[messageIndex].text, stringHeight * 2, boxWidth - BUFFER/2)
	
	
	if (text[messageIndex].sound != noone)
	{
		if (text[messageIndex].stopAudio) 
		{
			audio_stop_all()
		}
		
		audio_play_sound(text[messageIndex].sound, 1, false)
		text[messageIndex].sound = noone
	}
	
	if (text[messageIndex].screenShake)
	{
		global.okToShake = true
		text[messageIndex].screenShake = false
		alarm[1] = 50
	}
}



