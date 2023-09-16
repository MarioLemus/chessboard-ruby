class Board
  def initialize
    @score = {white: 0, black: 0}
    @turn = ''
    @board = {}
  end

  def render
    # if board is not being played yet, set it
    if @board.length == 0
      set
    end

    @board.each do |row|
      row.each do |el|
        print "#{el} "
      end
      puts
    end
  end

  def set
    require('./pieces')
    require('./utils/constants')
    # t, c, a, q, k, a, c ,t
    @b_rook = Pieces::Rook.new(PLAYER_2, B_ROOK, 8)
    @b_knight = Pieces::Knight.new(PLAYER_2, B_KNIGHT, 3)
    @b_bishop = Pieces::Bishop.new(PLAYER_2, B_BISHOP, 8)
    @b_queen = Pieces::Queen.new(PLAYER_2, B_QUEEN, 8)
    @b_king = Pieces::King.new(PLAYER_2, B_KING, 1)
    @b_pawn = Pieces::Pawn.new(PLAYER_2, B_PAWN, 1)

    @w_rook = Pieces::Rook.new(PLAYER_1, W_ROOK, 8)
    @w_knight = Pieces::Knight.new(PLAYER_1, W_KNIGHT, 3)
    @w_bishop = Pieces::Bishop.new(PLAYER_1, W_BISHOP, 8)
    @w_queen = Pieces::Queen.new(PLAYER_1, W_QUEEN, 8)
    @w_king = Pieces::King.new(PLAYER_1, W_KING, 1)
    @w_pawn = Pieces::Pawn.new(PLAYER_1, W_PAWN, 1)

    @board = {
      "8": [@b_rook.ascii, @b_knight.ascii, @b_bishop.ascii, @b_queen.ascii, @b_king.ascii, @b_bishop.ascii, @b_knight.ascii, @b_rook.ascii],
      "7": (@b_pawn.ascii * 8).split(''),
      "6": Array.new(8, '0'),
      "5": Array.new(8, '0'),
      "4": Array.new(8, '0'),
      "3": Array.new(8, '0'),
      "2": (@w_pawn.ascii * 8).split(''),
      "1": [@w_rook.ascii, @w_knight.ascii, @w_bishop.ascii, @w_queen.ascii, @w_king.ascii, @w_bishop.ascii, @w_knight.ascii, @w_rook.ascii],
      "-": ["a", "b", "c", "d", "e", "f", "g", "h"]
    }
  end

  def move_piece(from, to)
    from_row = from.split('')[1]
    position_in_row = from.split('')[0].to_i
    puts @board[from_row.to_sym][position_in_row]
  end
end



# peones
# movimiento en linea recta, come en diagonal, solo se mueve hacia adelante

# alfil
# movimiento en diagonal sin limites

# caballero
# se mueve 3 casillas en L

# torre
# se mueve en linea recta sin limites

# reina
# se mueve en todas las casillas sin limites (vertical, horizontal y diagonal)

# rey
# se mueve en todas las casillas, una casilla a la vez (vertical, horizontal y diagonal)
