require 'spec_helper'

describe Board do
  let(:board) {Board.new}

  describe "Create new array and check if position valid" do
    it "has a valid postion" do
      expect(board.valid_position?(1)).to eq(true)
    end
    it "should fail if position is not valid" do
      expect(board.valid_position?(10)).to raise_error
    end
    it "should return available positons on get_available_positions" do
      expect(board.get_available_positions).to eq([1,2,3,4,5,6,7,8,9])
    end

    it "chosen spot to see if it's available" do
      expect(board.chosen_spot? 3).to eq.(true)
    end
  end
end

