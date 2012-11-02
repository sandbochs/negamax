class OneToNGameNode < GameNode

  @@NODE_VALUES = {}
  attr_accessor :game_total

  def initialize(player, game_total, end_game_value)
    @player = player
    @game_total = game_total
    @end_game_value = end_game_value
  end

  def get_children
    return nil if @game_total >= @end_game_value
    new_player = 1 - @player
    [self.class.new(new_player, @game_total + 1, @end_game_value),
     self.class.new(new_player, @game_total + 2, @end_game_value)]
  end

  def leaf_value
    @game_total >= @end_game_value ? WIN : nil #nil means not a leaf
  end


  def value

    if @@NODE_VALUES.has_key?(self.game_total)
      return @@NODE_VALUES[self.game_total] #Return already saved value
    end
    
    if self.leaf_value != nil
      val = self.leaf_value
      @@NODE_VALUES[self.game_total] = val
      return val
    end
    
    #Ignore nodes that have already been searched
    # if @@NODE_VALUES.has_key?(self.game_total) == false
    #   val = self.get_children.map { |child| child.value.invert }.max
    #   @@NODE_VALUES[self.game_total] = val if val != nil
    #   return val
    # else
    #   return @@NODE_VALUES[self.game_total] #Return already saved value
    # end

    #Ignore nodes that have already been searched
    

    val = self.get_children.map { |child| child.value.invert }.max
    @@NODE_VALUES[self.game_total] = val
    val   
    
  end

  def node_values
    @@NODE_VALUES
  end

end