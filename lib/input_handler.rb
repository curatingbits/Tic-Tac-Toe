module InputHandler

  def choose_marker

    puts "Please choose your marker: "
    puts "'X' to be Xs"
    puts "'O' to be Os"

    puts
    marker_type = gets.chomp

    while wrong_input(marker_type)
      puts "\nYou entered a #{marker_type}, please select either X or O"
      puts
      marker_type = gets.chomp
    end

    return marker_type.upcase

  end

  def get_spot(board)
    puts "\nEnter [1-9]"
    spot = gets.chomp
    spot = spot.to_i if eligable_spot?(spot)
    puts
    while !spot.is_a?(Integer) || board.chosen_spot?(spot)
      puts "\nYou entered '#{spot}', that spot is either taken or you didn't enter a correct number. Enter [1-9]"
      spot = gets.chomp
      spot = spot.to_i if eligable_spot?(spot)
      puts
    end
    spot
  end

  private


  def eligable_spot?(spot)
    ('1'..'9').cover?(spot) unless spot.to_i > 9
  end


  def wrong_input(marker_type)
    marker_type != 'X' &&
      marker_type != 'x' &&
      marker_type != 'O' &&
      marker_type != 'o'

  end

end
