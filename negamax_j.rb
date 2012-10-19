#!/usr/bin/env ruby

 # TODO - figure out how to ruby-classify this
WIN = 2
TIE = 1
LOSE = 0

class GameNode

  def value
   return self.end_value if self.end_value != nil
   self.get_children.map { |child| -child.value }.max + 2
  end

end

# TODO - figure out how to pull logic into OneToNGameNode class

class OneToTenGameNode < GameNode

  def initialize(player, game_total)
    @player = player
    @game_total = game_total
    @end_value = 10
  end

  def get_children
    return nil if @game_total >= @end_value
    new_player = 1 - @player
    [OneToTenGameNode.new(new_player, @game_total + 1), OneToTenGameNode.new(new_player, @game_total + 2)]
  end

  def end_value
    @game_total >= @end_value ? WIN : nil
  end
end

startState = OneToTenGameNode.new(0, 7)
puts startState.value