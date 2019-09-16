require 'spec_helper'

describe Game do
  before do
    simulate_game
  end

  board = Board.new
  players = [Human.new('X'),Computer.new('O')]
  let(:game) {described_class.new(board, players)}

  describe "#Play the game" do
    it "End in draw" do
      play_game
      expect(@game.game_over?)
    end
  end
end
