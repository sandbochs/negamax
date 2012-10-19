class OneToNGameNode < GameNode

  attr_accessor :game_total

  def initialize(player, game_total)
    @player = player
    @game_total = game_total
    @end_game_value = 0
  end

  def get_children
    return nil if @game_total >= @end_game_value
    new_player = 1 - @player
    [self.class.new(new_player, @game_total + 1), self.class.new(new_player, @game_total + 2)]
  end

  def leaf_value
    @game_total >= @end_game_value ? WIN : nil #nil means not a leaf
  end

end