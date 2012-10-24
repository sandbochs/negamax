
class GameNode

  def value
   return self.leaf_value if self.leaf_value != nil
   #self.get_children.map { |child| child.value.invert }.max
   temp = []
   self.get_children.each do |child|
   	puts child.inspect
   	puts "val: #{child.value}"
   	temp << child.value.invert
   end
   temp.max

  end

end