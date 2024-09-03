# Connect-Four

Connect four is a fun game that you can play with your friends.

The aim of the game is to make four shapes of the same color connect either vertically(columns),horizontally(rows) or diagonally(principal+secondary)

The code that i written for this game works on the following steps:

-a board of 6 rows and 7 columns of black circles is generated (i used black because in my terminal they appear as white and it's easier to play)

-we make sure we correctly display the values with a simple loop

-after the first player chooses the name and color (there are 6 available colors the users can pick from), the second user can also choose a name and a color that's different from the first players's one

-the first player always gets to go first and he/she has to choose which column the game is going to start with

-after checking whether the values that i want to chose for my next move are logical/legal, i populate the board in a column with my chosen value

-in order to follow the rules of real life gravity i used a reverse loop for storing values,this mocks the values going all the way down to the bottom of the chosen column

-the board is scanned for a potential win every time a new value is added (a win is awarded if there is a connection on all 4 fronts) and also the number of turns the players have consumed up until that point(a draw is awarded for 42 turns; each player having 21 turns each)

-if there is no winner inside 42 turns (6 * 7 board),a draw is awarded and the game ends

Future ideas:
-saving the game's progress inside a directory and the users can choose to play it or start a new game
-adding new symbols and colors that the users can choose from
-creating a web-page designed for this game where the users can pick everything with the mouse (even their names)
-making everything customizable(the color of the board can be chosen,the shapes changed from circles to stars for example,adding a sound for winning in the web-page,creating a nice and cozy environment with nice backgrounds that the users can choose from and much more)

