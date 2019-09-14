class Computer
  attr_reader :mark

  #Set the computers  mark.
  def initialize(mark)
    @mark = mark
  end
  #next_move is passed the current game state.
  def next_move(game)
    min_max(game)[1]
  end

  def play board, position
    board[position] = @mark
  end

  private

  #Below is the implementation of the minimax algorithm, it recursively flips back and forth between players until a final score is determined to allow the computer to play the next best move.

  def min_max(game)
    return [score(game), nil] if game.game_over?
    #use an array to collect socres and the move of a given game to determin the next best move.
    scores = []
    #Get current player positions so minimax can determine a score for the next best move.
    game.board.get_available_positions.each do |move|
      #Create a new game and simulate futures moves to determine a score to assign to a player.
      possible_game = game.new_game(move)
      score = min_max(possible_game)[0]
      scores << [score, move]
    end
    #returns the min or max calculation
    if game.current_player.mark == "O"
      scores.max
    else
      scores.min
    end
  end

  #return the score for the current player mark
  def score(game)
    if game.winner.nil?
      0
    elsif game.winner.mark  == "O"
      +1
    elsif game.winner.mark == "X"
      -1
    end
  end
end

