/// @description Insert description here
// You can write your code in this editor
if (showText)
{
	if (messageIndex == array_length_1d(text) - 1)
	{
		showText = false
		visible = false
		messageIndex = 0
		text = []
		image_xscale = 1
	}
	
	else 
	{
		messageIndex++
	}
}

