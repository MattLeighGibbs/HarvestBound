/// @description Insert description here
// You can write your code in this editor

text = []

boxWidth = sprite_get_width(spr_battletextbox) * 1.4
stringHeight = string_height(text)

global.okToShake = false

messageIndex = 0

showText = false

stayOnScreen = false

BUFFER = 100

depth = 1