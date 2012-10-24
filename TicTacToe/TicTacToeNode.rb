#NEED TO FIX WINNING LOGIC TO LOSING
require './GameNode'
require './GameState'

class TicTacToeNode < GameNode

	attr_reader = :board

	def initialize(player, board)
		@player = player #X = 0, O = 1
		@board = board
	end

	def get_children
		leaf_val = self.leaf_value
		return leaf_val if leaf_val != nil

		@player == 0 ? next_player = "O" : next_player = "X"
		children = []
		0.upto(@board.length - 1) do |index|
			if @board[index].upcase != "X" && @board[index].upcase != "O"
				new_board = @board.slice(0..(index- 1)) + next_player + @board.slice((index + 1)..(@board.length - 1))
				children << self.class.new(1 - @player, new_board)
			end
		
		end
		children
	end

	def leaf_value
		if winning_board?(@player)
			return WIN
		elsif tie?
			return TIE
		elsif winning_board?(1 - @player)
			return LOSE
		end
		nil	#Not a leaf
	end

	def tie?
		0.upto(@board.length - 1) do |index|
			if @board[index].upcase != "X" && @board[index].upcase != "O"
				return false
			end
		end
		true
	end

	def winning_board?(player)
		if row_win?(player) || col_win?(player) || dia_win?(player)
			return true
		end
		false
	end


	def row_win?(player)
		rows.each do |row|
			return true if player == 0 && row == "XXX"
			return true if player == 1 && row == "OOO"
		end
		false
	end

	def col_win?(player)
		columns.each do |col|
			return true if player == 0 && col == "XXX"
			return true if player == 1 && col == "OOO"
		end
		false
	end

	def dia_win?(player)
		diagonals.each do |dia|
			return true if player == 0 && dia == "XXX"
			return true if player == 1 && dia == "OOO"
		end
		false
	end

	def rows
		row0 = (@board[0] + @board[1] + @board[2]).upcase
		row1 = (@board[3] + @board[4] + @board[5]).upcase
		row2 = (@board[6] + @board[7] + @board[8]).upcase
		[row0, row1, row2]
	end

	def columns
		col0 = (@board[0] + @board[3] + @board[6]).upcase
		col1 = (@board[1] + @board[4] + @board[7]).upcase
		col2 = (@board[2] + @board[5] + @board[8]).upcase
		[col0, col1, col2]
	end

	def diagonals
		diag0 = (@board[0] + @board[4] + @board[8]).upcase
		diag1 = (@board[2] + @board[4] + @board[6]).upcase
		[diag0, diag1]
	end

end