/// @description Insert description here
// You can write your code in this editor


if (shouldFlash && alarm[2] == 0)
{
	increment = .3
	if (image_alpha == 0 || image_alpha == 1)
	{
		increment *= -1
	}

	image_alpha += increment
	
	alarm[2] = 20
}
