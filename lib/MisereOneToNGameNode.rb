class MisereOneToNGameNode < GameNode

  attr_reader :game_total

  def initialize(player, options, game_total)
    super(player)
    @game_total = game_total
    @options[:end_game_value] ||= OneToNGameNode.options[:end_game_value]
    @end_game_value = @options[:end_game_value]
  end

  def get_child_nodes
    return nil if @game_total >= @end_game_value
    new_player = 1 - @player

    child_nodes = {}
    1.upto(2) do |delta| 
      child_nodes["#{delta}"] = self.class.new(new_player, @game_total + delta, @end_game_value)
    end

    child_nodes
  end

  def leaf_node_value
    @game_total >= @end_game_value ? EndState.LOSE : nil #nil means not a leaf
  end

  def eql?(other)
    @game_total == other.game_total
  end

  def hash
    3 * @game_total + 5 * @end_game_value
  end

  def to_s
    @game_total.to_s
  end

  def self.to_s
    "Misere One to N Game"
  end

  def self.default_options
    { :end_game_value => 10 }
  end

end