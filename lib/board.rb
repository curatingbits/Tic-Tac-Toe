class Board
  attr_accessor :state

  def initialize(state=nil)
    @state = (state || Array.new(9))
  end

  #If a player hasn't choosen a position return empty.
  def valid_position?(position)
    self[position].nil?
  end

  #Iterate over the state array starting with index 1 (0 isn't a board option) to find available space and then use map and pass a block to find current marks.

  def get_available_positions
    @state.each.with_index(1).select { |mark, index| mark.nil? }.map { |mark, index| index }
  end

  # New_board is used to help the computer use the minimax algorithm to simulate multiple games to determine the next best move.

  def new_board(position, mark)
    board = self.class.new @state.dup
    board[position] = mark
    board
  end

  def chosen_spot?(spot)
    @state[spot - 1] == 'X' || @state[spot - 1] == 'O'
  end

  #Set state position or raise index error if input handler module fails at it's job.
  def [](position)
    raise IndexError, "Bad position: #{position}" unless position.between?(1,9)
    @state[position - 1]
  end

  #Set state mark or raise argument error if input handler doesn't catch that a spot was already taken.
  def []= position, mark
    raise ArgumentError, "Position already taken #{position}" unless valid_position? position
    @state[position - 1] = mark
  end

  #Indicates if the board is full with player marks resulting in a tie.
  def full?
    !@state.include?(nil)
  end

  def display
    puts
    @state.each.with_index do |value, pos|
      value ||= (pos + 1)
      if pos % 3 == 1
        print " | #{value} | "
      else
        print " #{value}"
      end
      puts "\n---+---+---" if [2,5].include? pos
    end
    puts
  end
end

