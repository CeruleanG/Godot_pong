# Basic game mechanic
A ball is launched to the left from the center top of the screen and bounces against any physical object it touches (paddles and horizontal walls). 

The player controls the paddle on the left of the screen which is only able to move between rigid walls vertically. The AI controls the paddle on the right of the screen which is also only able  to move between rigid walls vertically. It alwasys adjust its position to be  as close as possible relative to the ball in the vertical axis.

A score value increments through time, whenever the ball touches the right side of the screen, the scene resets while having the playing holding the current score. If the ball touches the left side, however, the scene is reset but the score is not kept unless player has one more life (which is lost upon losing their first goal), and resets it to 0 while updating the highest score if necessary.

The game then loops back.

# TODO list
1. Add a feature to have the score accumulates faster as the game goes on.

2. Add a tutorial button so player can read about how to play the game

3. Add a background art to the game

4. Add a music to the game

# Known Issue
1. The ball's physic can be stucked within the collide box of a paddle. This might happen as the ball is being squished between a wall and the paddle. When the issue occurs, the ball will be stucked,  and upon release it will shoot itself off the screen.
