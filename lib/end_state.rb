class EndState

  include Comparable

  class<<self; attr_reader :all_states, :WIN, :TIE, :LOSE; end
  attr_reader :value

  def initialize(value, state_string)
    @value = value
    @state = state_string
    EndState.all_states[value] = self
  end
  
  # Add the WIN, TIE, LOSE, EndStates to the all_states hash
  @all_states = {}
  @WIN = EndState.new(1, "WIN")
  @TIE = EndState.new(0, "TIE")
  @LOSE = EndState.new(-1, "LOSE")
  
  def <=>(other)
    @value - other.value
  end

  def invert
    EndState.all_states[-@value]
  end

  def to_s
    @state
  end

end