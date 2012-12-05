### Ruby implentation of Negamax #####

I went off on a tangent while learning about nested arrays that eventually turned into writing an unbeatable Tic Tac Toe 'AI'. I started this during the third week of Dev Bootcamp and it took about a week to learn how to implement the negamax algorithm and write OneToTenGame. Once OneToTenGame was written, it was easy to implement OneToNGame and optimize retrieval time for node values. The Tic Tac Toe node only took a few hours to write after spending so much time with OneToNGame.

To-Do:
- ~~Need to figure out how to caluclate all the node.values only once instead of calculating all child.values every turn.~~
- ~~Create generic 'play' method in GameNode class~~
- ~~There should only be one GameNode value method~~
- ~~get_child_nodes should return a hash~~
- ~~LAW OF DEMETER~~
- ~~Override hash method in GameNode~~
- ~~Override eql? method in GameNode~~
- ~~Write tests for EndState~~
- Add TicTacToe to game_list
- Write tests for GameNode, NimGameNode, MisereGameNode
- Randomly choose a move to play if there are multiple child_nodes with the same value
- Convert to game_tree Ruby Gem!

Tic Tac Toe Goals:

- ~~Implement TicTacToeNode~~
- ~~Implement command-line UI~~
- Convert to generic game
- Memoize board values
- Prune branches already traversed
- Identify matching rotations and reflections and prune those branches aswell

Available Games:
- Nim
- Misere Nim