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

WIN = GameState.new(2, "WIN")
LOSE = GameState.new(0, "LOSE")

p [LOSE.invert, WIN.invert, WIN.invert].max