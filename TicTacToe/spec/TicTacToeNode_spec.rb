require_relative	'../TicTacToeNode'
require_relative '../GameNode'
require_relative '../GameState'

describe TicTacToeNode do
	WIN = GameState.new(2, "WIN")
	TIE = GameState.new(1, "TIE")
	LOSE = GameState.new(0, "LOSE")

	context "winning boards" do

		context "winning rows" do
			# X | X | X
			# 3 | 4 | 5
			# 6 | 7 | 8
			it "should be a win" do
				board = TicTacToeNode.new(0, "XXX345678")
				board.should be_winning_node(0)
			end

			# 0 | 1 | 2
			# X | X | X
			# 6 | 7 | 8
			it "should be a win" do
				board = TicTacToeNode.new(0, "012XXX678")
				board.should be_winning_node(0)
			end

			# 0 | 1 | 2
			# 3 | 4 | 5
			# X | X | X
			it "should not be a win for player 2" do
				board = TicTacToeNode.new(0, "012345XXX")
				board.should_not be_winning_node(1)
			end
		end

		context "winning columns" do
			# X | 1 | 2
			# X | 4 | 5
			# X | 7 | 8
			it "should be a win" do
				board = TicTacToeNode.new(0, "X12X45X78")
				board.should be_winning_node(0)
			end

			# 0 | X | 2
			# 3 | X | 5
			# 6 | X | 8
			it "should be a win" do
				board = TicTacToeNode.new(0, "0X23X56X8")
				board.should be_winning_node(0)
			end

			# 0 | 1 | X
			# 3 | 4 | X
			# 6 | 7 | X
			it "should not be a win for player 2" do
				board = TicTacToeNode.new(0, "01X34X67X")
				board.should_not be_winning_node(1)
			end
		end

		context "winning diagonals" do
			# X | 1 | 2
			# 3 | X | 5
			# 6 | 7 | X
			it "should be a win" do
				board = TicTacToeNode.new(0, "X123X567X")
				board.should be_winning_node(0)
			end

			# 0 | 1 | X
			# 3 | X | 5
			# X | 7 | 8
			it "should not be a win for player 2" do
				board = TicTacToeNode.new(0, "01X3X5X78")
				board.should_not be_winning_node(1)
			end
		end

	end

	context "tied board"	do
		# X | O | X
		# O | X | O
		# O | X | X
		it "should be a tie" do
			board = TicTacToeNode.new(0, "XOXOXOOXX")
			board.should be_tie
		end

		# O | X | O
		# X | O | X
		# O | X | X
		it "should be a tie" do
			board = TicTacToeNode.new(0, "OXOXOXOXX")
			board.should be_tie
		end
	end

	context "leaf values" do
		it "should have a leaf value of win" do
			# 0 | X | 2
			# 3 | X | 5
			# 6 | X | 8
			board = TicTacToeNode.new(0, "0X23X56X8")
			board.leaf_value.should == WIN
		end

		it "should have a leaf value of tie" do
			# O | X | O
			# X | O | X
			# O | X | X
			board = TicTacToeNode.new(0, "OXOXOXOXX")
			board.leaf_value.should == TIE
		end

		it "should have a leaf value of lose" do
			# 0 | 1 | O
			# 3 | O | 5
			# O | 7 | 8
			board = TicTacToeNode.new(0, "01O3O5O78")
			board.leaf_value.should == LOSE
		end
	end

	context "values" do
		it "should be a tied board 1" do
			# X | O | X
			# 3 | O | 5
			# 6 | X | O
			board = TicTacToeNode.new(0, "XOX3O56XO")
			board.value.should == TIE
		end

		it "should be a tied board 2" do
			# O | X | X
			# X | O | O
			# O | X | 8
			board = TicTacToeNode.new(0, "OXXXOOOX8")
			board.value.should == TIE
		end		

		it "should be a tied board 3" do
			# O | X | X
			# X | O | O
			# O | X | 8
			board = TicTacToeNode.new(0, "OXXXOOOXO")
			board.leaf_value.should == TIE
		end
	end


end