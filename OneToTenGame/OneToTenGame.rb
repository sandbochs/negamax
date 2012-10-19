require './GameState.rb'
require './GameNode.rb'
require './OneToNGameNode.rb'

class OneToTenGameNode < OneToNGameNode

  def initialize(player, game_total)
    super
    @end_game_value = 10
  end

end

class OneToTenGame

	def initialize
		@player1 = 0
		@player2 = 1
		@end_game_val = 10
		@current_val = 0
	end

	def play_as_one

		while @current_val < @end_game_val
			player_move(get_input)
			#AI Turn
			if @current_val < 10
				@current_val += ai_move(OneToTenGameNode.new(@player2, @current_val))
			else
				puts "Current Value: #{@current_val} - You Lost!"
			end
		end

	end

	def play_as_two
		#If AI is player 1 then randomly choose 1 or 2 to keep it interesting
		@current_val += Random.rand(1..2)	
		while @current_val < @end_game_val
			player_move(get_input)
			#AI Turn
			if @current_val < 10
				@current_val += ai_move(OneToTenGameNode.new(@player1, @current_val))
				puts "Current Value: #{@current_val} - You Win!" if @current_val >= 10
			else
				puts "Current Value: #{@current_val} - You Lost!"
			end
		end

	end

	def ai_move(node)
		node.get_children.each_with_index do |child, index|
			return index + 1 if child.value.invert == WIN
		end	

		if node.game_total < 9
			node.get_children.each_with_index do |child, index|
				return index + 1 if ai_move2(child) > 0
			end
		else
			return 1 #AI Loss
		end
	end

	def get_input
		begin
			puts "Your move! Current Value: #{@current_val}"
			puts "Please add 1 or 2"
			input = gets.chomp.to_i
		end while input < 1 || input > 2
		input
	end

	def player_move(input)
		case input
		when 1
			@current_val += 1
		when 2
			@current_val += 2
		end
	end

end

WIN = GameState.new(2, "WIN")
LOSE = GameState.new(0, "LOSE")
game = OneToTenGame.new
puts "Do you want to be Player 1 or 2?"
case gets.chomp.to_i
	when 1
		game.play_as_one
	when 2
		game.play_as_two
end
