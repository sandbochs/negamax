class MisereNimGameNode < NimGameNode

  def leaf_node_value
    @game_total >= @end_game_value ? EndState.LOSE : nil #nil means not a leaf
  end

  def hash
    5 * @game_total + 3 * @end_game_value
  end

  def self.to_s
    "Misere Nim"
  end

end