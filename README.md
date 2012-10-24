### Ruby implentation of Negamax #####

In progress 
Take everything and implement Tic Tac Toe.

- ~~Implement TicTacToeNode~~
- Implement command-line UI
- Refactor, refactor, refactor
- Memoize board values
- Prune branches already traversed
- Refactor, refactor, refactor
- Identify matching rotations and reflections and prune those branches aswell
- Refactor, refactor, refactor

OneToNGame2 calculcates all node values then stores it in a hash. The AI references the hash for each turn instead of traversing the game tree again.

~~Need to figure out how to caluclate all the node.values only once instead of calculating all children.values every turn.~~

OneToNGame lets the player choose to play up to N. It also lets the player choose to go first or second.

OneToTenGame is a two player game where player one starts with 0 and decides to add 1 or 2. Player two then receives the 0 board + 1 or 2 depending on what player one added. The first player to add to 10 or over loses.