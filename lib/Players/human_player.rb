class Human
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def choose_spot(board)
    spot = get_spot(board)
    board.update_spot(spot,mark )
  end

  def next_move(game)
    puts "\nYour turn, you are #{mark}. Numbers represent locations:"
    game.board.display
    puts
    loop do
      position = get_spot(game.board)
      if position.nil?
        puts "Invalid position!"
      else
        return position
      end
    end
  end

  def play(board, position)
    board[position] = @mark
  end

end
