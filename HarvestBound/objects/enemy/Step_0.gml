/// @description Insert description here
// You can write your code in this editor

if (instance_exists(obj_battle))
{
	speed = 0
}

if (distance_to_object(obj_mainplayer) <= 150) {    //prevents Bowser from running across the map to get you
      //if (collision_line(x,y,obj_mainplayer.x,obj_mainplayer.y,obj_collision,true,true) = noone) {
           direction=point_direction(x,y,obj_mainplayer.x,obj_mainplayer.y);
		   move_towards_point(obj_mainplayer.x, obj_mainplayer.y, spd)
    //}
}

if (place_meeting(x + hspeed, y + vspeed, obj_collision))
{
	hspeed = 0
	vspeed = 0
}

if (hp > 0 && shouldFlash && !alreadyFlashing)
{
	alarm[2] = 1
	alreadyFlashing = true
}

if (hp <= 0 && !alreadyFading)
{
	alarm[1] = 210
	alreadyFading = true
}

if (shouldShake)
{
	if (!alreadyShaking && alarm[3] <= 0)
	{
		alarm[3] = 135
		alarm[4] = 100
		alreadyShaking = true
	}
	
}
