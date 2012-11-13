require 'spec_helper'

describe EndState do
  
  context "default states" do

    it "has the default state WIN" do
      EndState.WIN.should eq EndState.new(1, "WIN")
    end

    it "has the default state TIE" do
      EndState.TIE.should eq EndState.new(0, "TIE")
    end

    it "has the default state LOSE" do
      EndState.LOSE.should eq EndState.new(-1, "LOSE")
    end

    it "only has 3 default states" do
      EndState.all_states.should have(3).things
    end

  end

  context "#invert" do

    it "inverts WIN to LOSE" do
      EndState.WIN.invert.should eq EndState.LOSE
    end

    it "inverts LOSE to WIN" do
      EndState.LOSE.invert.should eq EndState.WIN
    end

    it "inverts TIE to TIE" do
      EndState.TIE.invert.should eq EndState.TIE
    end

  end

  context "compare" do

    it "compares WIN to be greater than LOSE" do
      EndState.WIN.should be > EndState.LOSE
    end

    it "compares WIN to be greater than TIE" do
      EndState.WIN.should be > EndState.TIE
    end

    it "compares TIE to be greater than LOSE" do
      EndState.TIE.should be > EndState.LOSE
    end

  end

end