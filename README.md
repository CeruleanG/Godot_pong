# Introduction
This project is a personal learning playground for basic game developpement in
the Godot game engine.

# Basic game mechanic
A ball is launched to the left from the center top of the screen and bounces against any physical 
object it touches (paddles and horizontal walls). 

The player controls the paddle on the left of the screen which is only able to move between rigid 
walls vertically. The AI controls the paddle on the right of the screen which is also only able to 
move between rigid walls vertically. It alwasys adjust its position to be  as close as possible 
relative to the ball in the vertical axis.

A score value increments through time, whenever the ball touches the right side of the screen, the 
scene resets while having the playing holding the current score. If the ball touches the left side, 
however, the scene is reset but the score is not kept unless player has one more life (which is lost
upon losing their first goal), and resets it to 0 while updating the highest score if necessary.

The game then loops back.

# Asset Credits
This project used assets from online creators:
	
1. Sound effect: https://jdwasabi.itch.io/8-bit-16-bit-sound-effects-pack

2. UI sprite: https://cupnooble.itch.io/sprout-lands-asset-pack

3. Heart sprite: https://atebits.itch.io/health-pack
