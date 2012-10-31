class GameState
  
  @all_states = {}
  
  attr_reader :value

  def initialize(value, state_string)
    @value = value
    @state = state_string
    @all_states[value] = self
  end

  def <=>(other)
    @value - other.value
  end

  def invert
    @all_states [2 - @value]
  end

  def to_s
    @state
  end

  def get_states
    @all_states 
  end
end


class A
  class<<self;attr_accessor :states;end
  @states = []

  def get_states
    A.states
  end

  def set_state(state)
    A.states <<