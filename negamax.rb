class GameState
  
  @@ALL_STATES = {}
  
  attr_reader :value

  def initialize(value, state_string)
    @value = value
    @state = state_string
    @@ALL_STATES[value] = self
  end

  def <=>(other)
    @value - other.value
  end

  def invert
    @@ALL_STATES[2 - @value]
  end

  def to_s
    @state
  end

end

class GameNode

  def value
   return self.leaf_value if self.leaf_value != nil
   self.get_children.map { |child| child.value.invert }.max
  end

end

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

class OneToTenGameNode < OneToNGameNode

  def initialize(player, game_total)
    super
    @end_game_value = 10
  end

end

class OneToFiveGameNode < OneToNGameNode

  def initialize(player, game_total)
    super
    @end_game_value = 5
  end

end
