require './GameNode.rb'
require './OneToNGameNode.rb'
require './GameState.rb'

class OneToNGame

  def initialize

    @ai_player_num = 0 #0 - AI player 1, 1 - AI player 2
    @end_game_value = 0
    @current_value = 0

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
    if @ai_player_num == 0
      @current_value += ai_move(OneToNGameNode.new(@ai_player_num, @current_value, @end_game_value))
    end

    while @current_value < @end_game_value
      player_move(get_input)
      #AI Turn
      if @current_value < @end_game_value
        move = ai_move(OneToNGameNode.new(@ai_player_num, @current_value, @end_game_value))
        puts "Current Value: #{@current_value} - Computer adds: #{move}"
        @current_value += move  
      else
        puts "Current Value: #{@current_value} - You Lost!"
      end
    end

  end

  def ai_move(node)
    #Choose best immediate child node
    node.get_children.each_with_index do |child, index|
      return index + 1 if child.value.invert == WIN
    end 

    #If both child nodes result in a loss choose node with chance to win
    if node.game_total < @end_game_value - 1
      node.get_children.each_with_index do |child, index|
        return index + 1 if ai_move(child) > 0
      end
    else
      return 1 #AI Loss
    end

  end

  def end_game_value

    puts "What number would you like to play up to?"
    begin
      input = gets.chomp.to_i
      puts "Please choose a number greater than 5" if input < 5
    end while input < 5
    @end_game_value = input
  end

  def get_input

    begin
      puts "Current Value: #{@current_value} - Your move! "
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
