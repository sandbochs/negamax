### Ruby implentation of Negamax #####

I went off on a tangent while learning about nested arrays that eventually turned into writing an unbeatable Tic Tac Toe 'AI'. I started this during the third week of Dev Bootcamp and it took about a week to learn how to implement the negamax algorithm and write OneToTenGame. Once OneToTenGame was written, it was easy to implement OneToNGame and optimize retrieval time for node values. The Tic Tac Toe node only took a few hours to write after spending so much time with OneToNGame.

To-Do:
- ~~Create generic 'play' method in GameNode class~~
- ~~There should only be one GameNode value method~~
- ~~get_child_nodes should return a hash~~
- ~~LAW OF DEMETER~~
- ~~Override hash method in GameNode~~
- ~~Override eql? method in GameNode~~
- Write tests for GameNode, OneToNGameNode, MisereOneToNGameNode, EndState

Tic Tac Toe Goals:

- ~~Implement TicTacToeNode~~
- ~~Implement command-line UI~~
- Memoize board values
- Prune branches already traversed
- Identify matching rotations and reflections and prune those branches aswell

OneToNGame2 calculcates all node values then stores it in a hash. It does not recalculate the value of nodes that are identical to nodes it has already traversed. The AI references the hash for each turn instead of traversing the game tree again.

~~Need to figure out how to caluclate all the node.values only once instead of calculating all child.values every turn.~~

OneToNGame lets the player choose to play up to N. It also lets the player choose to go first or second.

OneToTenGame is a two player game where player one starts with 0 and decides to add 1 or 2. Player two then receives the 0 board + 1 or 2 depending on what player one added. The first player to add to 10 or over loses.