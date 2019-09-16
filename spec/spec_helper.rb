require_relative '../lib/tictactoe.rb'


module Helpers

  def simulate_game
    @comp_x = Computer.new('X')
    @comp_o = Computer.new('O')
    @game = Tictactoe.new([@comp_x, @comp_o])
  end

  def play_game
    while @game.winner.nil?
      simulate_game
      @game.play
      if @game.game_over?
        break
      end
    end
  end
end
RSpec.configure do |c|
  c.include Helpers
end
