#!/usr/bin/env ruby
require './GameNode.rb'
require './OneToNGameNode2.rb'
require './GameState.rb'

class OneToNGame

	def initialize

		@ai_player_num = 0 #0 - AI player 1, 1 - AI player 2
		@end_game_value = 0
		@current_value = 0
		@node_values = {}
		@last_player = 0

	end

	def start
		end_game_value
		puts "Do you want to be Player 1 or 2?"
		case gets.chomp.to_i
		when 1
			@ai_player_num = 1
			play
		when 2
			play
		end

	end

	def play
		nodes = OneToNGameNode.new(0, @current_value, @end_game_value)	#create starting node
		nodes.value #calculate node values
		@node_values = nodes.node_values #store node values
		puts @node_values

		if @ai_player_num == 0	#AI goes first if human chooses to be player 2
			ai_move(ai_strat(@current_value))
		end

		while @current_value < @end_game_value - 1
			player_move(get_input)	#Player turn
			@last_player = 1 - @ai_player_num
			#AI Turn
			if @current_value < @end_game_value - 1
				ai_move(ai_strat(@current_value))
				@last_player = @ai_player_num	
			end
		end

		winning_message

	end

	def ai_move(add_value)
		puts "Current Value: #{@current_value} - AI adds #{add_value}"
		@current_value += add_value
	end

	def ai_strat(current_value)
		#Choose best immediate child node
		return 1	if @node_values[current_value + 1].invert == WIN
		return 2	if @node_values[current_value + 2].invert == WIN

		#If both child nodes result in a loss, look at child nodes' children
		return 1 if ai_strat(current_value + 1) > 0
		return 2 if ai_strat(current_value + 2) > 0
		return 1 #AI loss
	end

	def winning_message
		if @last_player == @ai_player_num
			puts "Current Value: #{@current_value} - You Lost!"
		else
			puts "You Win!"
		end
	end

	def end_game_value

		puts "What number would you like to play up to?"
		begin
			input = gets.chomp.to_i
			puts "Please choose a number greater than 5" if input <= 5
		end while input <= 5
		@end_game_value = input

	end

	def get_input

		begin
			puts "Current Value: #{@current_value} - Your move!"
			puts "Please add 1 or 2"
			input = gets.chomp.to_i
		end while input < 1 || input > 2
		input

	end

	def player_move(input)

		case input
		when 1
			@current_value += 1
		when 2
			@current_value += 2
		end

	end

end

WIN = GameState.new(2, "WIN")
LOSE = GameState.new(0, "LOSE")

game = OneToNGame.new
game.start
