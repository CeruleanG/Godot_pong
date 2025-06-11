# Basic game mechanic
A ball is launched to the left from the center top of the screen and bounces against any physical object it touches (paddles and horizontal walls).

The player controls the paddle on the left of the screen which is only able to move between rigid walls vertically. The AI controls the paddle on the right of the screen which is also only able to move between rigid walls vertically. It alwasys adjust its position to be as close as possible relative to the ball in the vertical axis.

Whenever the ball touches the left side of the screen, the AI wins a point, same for the player if the ball goes to right. In which case, the score is updated and the ball is reset to the center of the screen and the game loops.

# TODO list
1. Implement a highest score system that saves past progress. It should change the display msg when the player breaks the score.

2. After the highest score system is implemented, add a mechanic where the player has 2 lifes to break the highest score. To Implement it, the current score system should be replaced.

# Known Issue
1. The ball's physic can be stucked within the collide box of a paddle. This might happen as the ball is being squished between a wall and the paddle. When the issue occurs, the ball will be stucked,  and upon release it will shoot itself off the screen.
