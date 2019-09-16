require 'spec_helper'

describe Board do
  let(:board) {described_class.new}

  describe "Create new array and check if position valid" do
    it "has a valid postion" do
      expect(board.valid_position?(1)).to eq(true)
    end

    it "should return available positons on get_available_positions" do
      expect(board.get_available_positions).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "#full board not full" do
      expect(board.full?).to eq(false)
    end

    it "#full board full" do
      board.state = ['X', 'O', 'X', 'O', 'X', 'O', 'X', 'O','X']
      expect(board.full?).to eq(true)
    end
  end
end

