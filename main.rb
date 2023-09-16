=begin
board
  . {
      score,
      turn,
      white_taken,
      black_taken
    }
  . render
  . reset
  . move_piece(coordinate) -> take out its allow distance limit

pieces
  . {
    color,
    unicode,
    valid_distance
  }
=end

class Main
  def self.start
    require('./board')
    require('./pieces')

    puts 'This is a chess game to quit: (q)'
    puts 'To move your pieces you have to select its'
    puts 'Letter representation + its coordinates on board'
    puts 'Something like in the following format -> k-a1 , k is for "knight"'
    puts ''

    board = Board.new
    board.render
    # switch case with user input
    # from a6 to a8 -> (piece)-(column)(row)

    loop do
      puts 'PLAYER 1 (white) make your move:'
      print 'from: '
      from = gets.chomp
      print 'to: '
      to = gets.chomp
      board.move_piece(from, to)
    end

    end
end

Main.start
