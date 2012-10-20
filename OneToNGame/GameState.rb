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

  def get_states
    @@ALL_STATES
  end
end