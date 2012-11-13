
class GameNode

  class<<self; attr_accessor :node_values; end
  @node_values = {}

  def value
    if GameNode.node_values.has_key?(self)
      return GameNode.node_values[self] #Return already saved value
    end

    if self.leaf_value != nil
      val = self.leaf_value
      GameNode.node_values[self] = self.leaf_value
      return val
    end

    val = self.get_child_nodes.map { |child| child.value.invert }.max
    GameNode.node_values[self] = val
  end

end