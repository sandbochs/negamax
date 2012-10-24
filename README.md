### Ruby implentation of Negamax #####

OneToNGame lets the player choose to play up to N. It also lets the player choose to go first or second.

OneToNGame2 calculcates all node values then stores it in a hash. The AI references the hash for each turn instead of traversing the game tree again.

~~Need to figure out how to caluclate all the node.values only once instead of~~ ~~calculating all children.values every turn.~~
Implemented!

Would like to implement Alpha Beta pruning.

<In progress> Take everything and implement Tic Tac Toe.
Implented Tic Tac Toe node! Need to fix the winning logic to lose... when a player receives a "winning" board that means he lost
