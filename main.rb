class Main
  def self.start
    require('./board')
    require('./pieces')

    puts 'This is a chess game to quit: (q)'
    puts 'To move your pieces you have to select its'
    puts 'Letter representation + its coordinates on board'
    puts 'Something like in the following format -> from: a1 to: b3'
    puts

    board = Board.new
    board.render

    loop do
      puts
      puts "Do you want to continue playing the game?"
      print "Press whatever key to continue, otherwise ( q ): "
      input_quit = gets.chomp
      if input_quit.eql?("q")
        puts "GAME OVER"
        break
      end

      puts
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
