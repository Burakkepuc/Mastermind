# Mastermind

## Phase 1 - Game Logic

Gameplay and rules
Assets:

- a decoding board, with a shield at one end covering a row of four large holes, and **twelve additional rows** containing four large holes next to a set of four small holes;
- code pegs of **six different colors**, with round heads, which will be placed in the large holes on the board; and
- key pegs, some **colored black**, some **white**, which are flat-headed and smaller than the code pegs; they will be placed in the small holes on the board.

Gameplay:

1. One player becomes the codemaker, the other the codebreaker.
2. The codemaker chooses a pattern of four code pegs.
3. The codemaker places the chosen pattern in the four holes covered by the shield, visible to the codemaker but not to the codebreaker.
4. The codebreaker tries to guess the pattern, **in both order and color**, twelve turns. Each guess is made by placing a row of code pegs on the decoding board
5. Once placed, the codemaker provides feedback by placing from zero to four key pegs in the small holes of the row with the guess.
   -A black key peg is placed for each code peg from the guess which is correct in both color and position.
   -A white key peg indicates the existence of a correct color code peg placed in the wrong position.
6. Once feedback is provided, another guess is made; guesses and feedback continue to alternate until either the codebreaker guesses correctly, or all rows on the decoding board are full.

- 12 turn, each turn will codemaker provides feedback

## Phase 2

1. Now refactor your code to allow the human player to choose whether they want to be the creator of the secret code or the guesser.

## Phase 3

The computer will guess if you decide to choose your own secret colors. You may choose to implement a computer strategy that follows the rules of the game or you can modify these rules.

1. Enter four colours in order.
2. Computer will guess their order.

1)  12 turn it will call the `check_guess` method but different parameter.

--> Enter 4 colours that it is your create_code array.
--> Computer loops 12 time and each time, it shuffles the array.
--> Until the colour will same with our create_code array.
