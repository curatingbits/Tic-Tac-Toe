require_relative '../lib/tictactoe.rb'
require_relative '../lib/input_handler.rb'
require_relative '../lib/Players/computer_player.rb'
require_relative '../lib/Players/human_player.rb'

include InputHandler

puts "What would you like to be, X or O?"

marker_type = choose_marker

if marker_type.match ('X')
  player1 = Human.new('X')
  player2 = Computer.new('O')
elsif
  player1 = Human.new('O')
  player2 = Computer.new('X')
end

game = Tictactoe.new([player1,player2])

game.play

winner = game.winner

if winner.nil?
  puts "\nNo winner"
else
  puts "\nwinner is #{winner.mark}"
end
