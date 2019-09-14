class Game
  attr_accessor :board, :players

  def initialize(board, players)
    @board = board
    @players = players
  end

  def play
    until game_over?
      mark = current_player.next_move(self)
      current_player.play(@board, mark)
      board.display
      next_player
    end
  end

  def game_over?
    !winner.nil? || draw?
  end

  def current_player
    @players[0]
  end

  private

  def next_player
    @players.rotate!
  end
end
