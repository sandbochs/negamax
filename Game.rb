#!/usr/bin/env ruby
require './lib/GameNode'
require './lib/OneToNGameNode'
require './lib/MisereOneToNGameNode'
require './lib/EndState'

# Ask how to create available games from require


class Game

  class<<self; attr_accessor :game_node_classes; end
  @game_node_classes = [OneToNGameNode, MisereOneToNGameNode]

  def initialize
    @end_game_value = 0
    @current_board = 0
  end

  def start

    choose_game
    @ai_player = 1 - choose_player
    play

  end

  def choose_game
    number_of_games = Game.game_node_classes.length

    puts "Avaliable Games:"
    Game.game_node_classes.each_with_index do |game_class, index|
      puts "#{index + 1}: #{game_class.to_s}"
    end

    while true
      print "Which game would you like to play? >> "
      game = gets.chomp.to_i
      valid_game = game > 0 && game <= number_of_games
      if valid_game
        break
      else
        puts "Pick a number between 1 and #{number_of_games}"
      end
    end

    game_node_class = Game.game_node_classes[game - 1]
    options = game_node_class.default_options
    options.each do |option, value|
      print "Please set value for: #{option} (default: #{value}) >> "
      input = gets.chomp
      if !input.empty?
        options[option] = input.to_i
      end
    end

    @current_board = game_node_class.new(0, options)

  end

  def choose_player

    while true
      print "Would you like to be player 1 or 2? >> "
      player = gets.chomp
      valid_player = player == "2" || player == "1"
      if valid_player
        break
      else
        puts "Please choose 1 or 2!"
      end
    end

    player.to_i

  end

  def play

    while !@current_board.leaf?
      puts "Current board: "
      puts @current_board.to_s
      if @current_board.player == @ai_player
        ai_move, @current_board = @current_board.optimal_move
        puts "AI Played: #{ai_move}"
      else
        @current_board = @current_board.get_child_nodes[player_move]
      end
    end

    winning_message

  end

  def player_move

    possible_moves = @current_board.get_child_nodes
    puts "Possible moves: "
    possible_moves.each { |move, node| puts move }

    while true
      print "Input move >> "
      move = gets.chomp
      valid_move = possible_moves.has_key?(move)
      if valid_move
        break
      else
        puts "Invalid move!"
      end
    end

    move

  end

  def winning_message

    if @current_board.player == @ai_player
      puts "AI #{@current_board.value}!"
    else
      puts "You #{@current_board.value}!"
    end

  end

end

game = Game.new
game.start
