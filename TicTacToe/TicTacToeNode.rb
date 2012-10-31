require './GameState'
require './GameNode'

class TicTacToeNode < GameNode
  
  #@NODE_VALUES = {}
  BOARD_LENGTH = 8
  attr_reader :board

  def initialize(player, board)
    @player = player #X = 0, O = 1
    @board = board
    @values = {}
  end

  #FOR MEMOIZATION
  # def node_values 
  #   @NODE_VALUES
  # end

 #FOR MEMOIZING NODE VALUES 
 # def value
 #  if self.leaf_value != nil
 #    @@NODE_VALUES[@board] = self.leaf_value
 #    return self.leaf_value 
 #  end

 #  values = []
 #  self.get_children.each do |child|
 #  child_value = child.value.invert
 #  @@NODE_VALUES[child.board] = child_value
 #  values << child_value
 #  end
 #  values.max
 # end

  # Returns the value of a node with no more possible moves
  def leaf_value
    if winning_node?(@player)
      return WIN
    elsif winning_node?(1 - @player) && !tie? # Checks if other player lost
      return LOSE
    elsif tie?
      return TIE
    end
    nil #Not a leaf
  end

  def get_children
    # Return WIN, TIE, or LOSE, if it is a leaf node
    leaf_val = self.leaf_value
    return leaf_val unless leaf_val.nil?

    # Create the boards for each possible move and store them in array children
    children = []
    0.upto(BOARD_LENGTH) do |index|
      children << self.class.new(1-@player, new_board(index)) if cell_empty?(index)
    end
    children

    # Seems like this refactor of the code above should work... but it doesn't
    # (0..BOARD_LENGTH).reduce([]) do |children, index|
    #   children << self.class.new(1 - @player, new_board(index)) if cell_empty?(index)
    # end
  end

  # Inserts a player marker at index
  def new_board(index)
    board = "" # << Need to keep empty board if starting at first index
    board = @board.slice(0..index - 1) if index > 0 # Get the board before the index
    @player == 0 ? board << "X" : board << "O" # Insert player move
    board << @board.slice(index + 1..-1) # Get the board after the index
    board
  end

  def valid_space?(index)
    return cell_empty?(index) if index >= 0 && index <= @board.length - 1
    false
  end 

  def cell_empty?(index)
    return false if @board[index] == "X" || @board[index] == "O"
    true
  end

  def tie?
    # If any cells are empty it can't be a tie...
    0.upto(BOARD_LENGTH) { |index| return false if cell_empty?(index) }
    true
  end

  def winning_node?(player)
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
    row0 = (@board[0] + @board[1] + @board[2])
    row1 = (@board[3] + @board[4] + @board[5])
    row2 = (@board[6] + @board[7] + @board[8])
    [row0, row1, row2]
  end

  def columns
    col0 = (@board[0] + @board[3] + @board[6])
    col1 = (@board[1] + @board[4] + @board[7])
    col2 = (@board[2] + @board[5] + @board[8])
    [col0, col1, col2]
  end

  def diagonals
    diag0 = (@board[0] + @board[4] + @board[8])
    diag1 = (@board[2] + @board[4] + @board[6])
    [diag0, diag1]
  end

end