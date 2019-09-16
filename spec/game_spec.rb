require 'spec_helper'

describe Tictactoe do
  players = [Human.new('X'),Computer.new('O')]
  let(:tictactoe) {described_class.new( players)}

  describe "#create new game" do
    it "has board and players" do

    end
  end
end
