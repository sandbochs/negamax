require 'spec_helper'

describe GameNode do

  describe "#value" do
    let(:game_node) { GameNode.new }
    context "when included in GameNode node values" do
      before :each do
        GameNode.node_values[game_node] = 5
      end

      it "returns that node value" do
        game_node.value.should eq 5
      end
    end

    context "when leaf_node_value is not nil" do
      it "sets GameNode.node_value" do

      end

      it "returns the leaf_node_value" do

      end
    end

    context "in other cases" do
      it "sets GameNode.node_value" do

      end
    end
    
  end

end