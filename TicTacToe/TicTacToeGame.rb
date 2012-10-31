require './TicTacToeNode'
require './GameState'
require 'yaml'

class TicTacToeGame

  def initialize
    @ai_player = 0
    @current = TicTacToeNode.new(0, "012345678")
  end

  # def load_node_values(file_name)
  #   @node_values = YAML.load_file(file_name)
  # end

  def play
    if @ai_player == 0 #If AI is player 1, choose middle spot always
      @current = TicTacToeNode.new(1, "0123X5678")
    end

    begin
      set_move(player_input)
      puts "Thinking..."
      ai_move
    end until @current.winning_node?(@ai_player) || @current.tie?

    draw_board
    @current.tie? ? (puts "TIE GAME") : (puts "YOU LOST")
  end

  def ai_move
    @current = TicTacToeNode.new(1 - @ai_player, ai_strategy)
  end

  def ai_strategy
    # Choose first WIN child node else go for TIE
    move = ""
    is_win = false
    win_this_turn = false
    children = @current.get_children

    children.each do |child|
      if child.value.invert == WIN
        move = child.board if win_this_turn == false
        win_this_turn = true if child.winning_node?(@ai_player)
        is_win = true
      elsif child.value.invert == TIE
        move = child.board if is_win == false
      end
    end
    move
  end

  def draw_board
    @current.rows.each { |row| puts " #{row[0]} | #{row[1]} | #{row[2]}"}
  end

  def set_move(index)
    board = ""
    board = @current.board[0..index - 1] if index > 0
    @ai_player == 0 ? board << "O" : board << "X" # If AI is player 1 then player is "O"
    board << @current.board[index + 1..-1]
    @current = TicTacToeNode.new(@ai_player, board)
  end

  def player_input
    begin
      draw_board
      puts "Choose a space"
      input = gets.chomp.to_i
    end until @current.valid_space?(input)
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
#ttt.load_node_values('node_values.yml')
ttt.choose_starting_player