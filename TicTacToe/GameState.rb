class GameState
  
  class<<self; attr_accessor :all_states; end
  @all_states = {}
  
  attr_reader :value

  def initialize(value, state_string)
    @value = value
    @state = state_string
    GameState.all_states[value] = self
  end

  def <=>(other)
    @value - other.value
  end

  def invert
    GameState.all_states[2 - @value]
  end

  def to_s
    @state
  end

  def get_states
    GameState.all_states 
  end

end