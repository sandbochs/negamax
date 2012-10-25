require './TicTacToeNode'
require './GameNode'
require './GameState'

class TicTacToeGame

	def initialize
		@ai_player = 0
		@current = TicTacToeNode.new(0, "012345678")
	end

	def play
		if @ai_player == 0 #If AI is player 1, choose middle spot always
			@current = TicTacToeNode.new(1, "0123X5678")
		end

		#TEST
		# O | 1 | X 
		# 3 | 4 | O
		# O | X | X
		#@current = TicTacToeNode.new(0, "O1X34OOXX")
		# draw_board
		# ai_move
		# draw_board
		#test
		#END
		begin
			input = player_input
			set_move(input, 1 - @ai_player)
			puts "Thinking..."
			ai_move
		end until @current.winning_node?(@ai_player) || @current.tie?
		draw_board
	end

	def test
		child = @current.get_children
		child.each do |child|
			test_draw(child)
			puts "VAL: #{child.value.invert}"
			puts "Board: #{child.board}"
		end
	end

	def test_draw(child)
		child.rows.each { |row| puts " #{row[0]} | #{row[1]} | #{row[2]}"}
	end

	def ai_move
		@current = TicTacToeNode.new(1 - @ai_player, ai_strategy)
	end

	def ai_strategy
		#Choose first WINNING child node
		children = @current.get_children
		children.each do |child|
			return child.board if child.value.invert == WIN
		end

		#Try to TIE
		children.each do |child|
			return child.board if child.value.invert == TIE
		end

	end

	def draw_board
		@current.rows.each { |row| puts " #{row[0]} | #{row[1]} | #{row[2]}"}
	end

	def set_move(index, player)
		current_board = @current.board

		if index == 0
			new_board = ""
		else
			new_board = current_board[0..(index - 1)]
		end
		player == 0 ? new_board << "X" : new_board << "O"
		new_board << current_board[(index + 1)..-1]
		@current = TicTacToeNode.new(1 - player, new_board)
	end

	def player_input
		begin
			draw_board
			puts "Choose a space"
			input = gets.chomp.to_i
		end while !@current.cell_empty?(input)
		input
	end

	def choose_starting_player
		begin
			puts "Do you want to be Player 1:(X) or 2:(O)?"
			input = gets.chomp.to_i
		end while input < 1 || input > 2

		case input
		when 1
			@ai_player = 1
			play
		when 2
			play
		end
	end

end

WIN = GameState.new(2, "WIN")
TIE = GameState.new(1, "TIE")
LOSE = GameState.new(0, "LOSE")

ttt = TicTacToeGame.new
ttt.choose_starting_player