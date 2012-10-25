class GameNode

  def value
   return self.leaf_value if self.leaf_value != nil
   self.get_children.map { |child| child.value.invert }.max
  end

end