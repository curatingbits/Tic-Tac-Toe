require_relative 'board'
require_relative 'Players/computer_player'
require_relative 'Players/human_player'
require_relative 'input_handler'
require_relative 'game'

class Tictactoe < Game
  include InputHandler

  attr_reader :board, :players

  def initialize(players, board=nil)
    board ||= Board.new
    super board, players
  end

  #setup an array with winning line sequence so winner method can check to see if player has won.
  WINNING_LINES = [
    [1,4,7], [2,5,8], [3,6,9],
    [1,2,3], [4,5,6], [7,8,9],
    [1,5,9],[3,5,7]]

  #iterate over the winning lines array and then check to see if player marks make up consecutive lines resulting in a win.
  def winner
    WINNING_LINES.each do |winning_line|
      @players.each do |player|
        return  player if winning_line.all? { |position| @board[position] ==  player.mark }
      end
    end
    nil
  end

  def start_game
    game.play
  end

  def draw?
    board.full? && winner.nil?
  end

  #new_game is used by minimax to create instances of new boards and instances of games to recursively simulate future moves to determine the next best move for the computer.
  def new_game(position)
    board = @board.new_board(position, current_player.mark)
    self.class.new(@players.rotate, board)
  end
end
