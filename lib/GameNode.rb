
class GameNode

  class<<self; attr_accessor :node_values; end
  @node_values = {}

  attr_reader :player

  def initialize(player, options)
    @player = player
    @options = options
  end

  def value
    if GameNode.node_values.has_key?(self)
      return GameNode.node_values[self] #Return already saved value
    end

    if self.leaf_node_value != nil
      val = self.leaf_node_value
      GameNode.node_values[self] = self.leaf_node_value
      return val
    end

    val = self.get_child_nodes.map { |move, node| node.value.invert }.max
    GameNode.node_values[self] = val
  end

  def optimal_move
    child_nodes = self.get_child_nodes
    best_move, best_node = child_nodes.first
    child_nodes.each do |move, node|
      if node.value < best_node.value
        best_move = move 
        best_node = node
      end
    end
    [best_move, best_node]
  end

  def leaf?
    !self.leaf_node_value.nil?
  end

  def get_child_nodes
    raise NotImplementedError
  end

  def leaf_node_value
    raise NotImplementedError
  end

  def eql?(other)
    raise NotImplementedError
  end

  def hash
    raise NotImplementedError
  end

  def to_s
    raise NotImplementedError
  end

  def self.to_s
    raise NotImplementedError
  end

  def self.options
    raise NotImplementedError
  end

end