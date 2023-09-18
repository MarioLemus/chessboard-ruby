class Board
  def initialize
    @score = {white: 0, black: 0}
    @turn = ''
    @board = {}
    @EMPTY_SQUARE = "."
  end

  def render
    side_row_id = 8
    # if board is not being played yet, set it
    if @board.length == 0
      set
    end

    @board.values().each do |row|
      # print side numbers
      print "#{side_row_id == 0 ? " " : side_row_id} "
      side_row_id -= 1
      # print row
      row.each do |el|
        print "#{el == "." || ('a'..'h').include?(el) ? el : el.ascii} "
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
      "8": [@b_rook, @b_knight, @b_bishop, @b_queen, @b_king, @b_bishop, @b_knight, @b_rook],
      "7": [@b_pawn, @b_pawn, @b_pawn, @b_pawn, @b_pawn, @b_pawn, @b_pawn, @b_pawn],
      "6": Array.new(8, @EMPTY_SQUARE),
      "5": Array.new(8, @EMPTY_SQUARE),
      "4": Array.new(8, @EMPTY_SQUARE),
      "3": Array.new(8, @EMPTY_SQUARE),
      "2": [@w_pawn, @w_pawn, @w_pawn, @w_pawn, @w_pawn, @w_pawn, @w_pawn, @w_pawn],
      "1": [@w_rook, @w_knight, @w_bishop, @w_queen, @w_king, @w_bishop, @w_knight, @w_rook],
      "-": ["a", "b", "c", "d", "e", "f", "g", "h"]
    }
  end

  def move_piece(from, to)
    extract_coordinates = lambda {|str, el| str.split('')[el]}
    # old position
    curr_y = extract_coordinates.call(from, 1)
    curr_x = extract_coordinates.call(from, 0)
    # new position
    new_y = extract_coordinates.call(to, 1)
    new_x = extract_coordinates.call(to, 0)
    # transform column in indexes a, b, c -> 0, 1, 2
    column_indexes = {a:0, b:1, c:2, d:3, e:4, f:5, g:6, h:7}

    # check its color to change turns
    # check its valid movement distance
    # generate a nested loop with valid coords, per piece
    begin
      @piece = @board[curr_y.to_sym][column_indexes[curr_x.to_sym]]
      # check movement validity
      if is_valid_movement?(curr_y, curr_x, new_y, new_x)
        # make the change
        @board[new_y.to_sym][column_indexes[new_x.to_sym]] = @piece
        # update square with an empty space if the piece gets out of its original position
        # update square with an empty space if the piece eats the enemy piece
        @board[curr_y.to_sym][column_indexes[curr_x.to_sym]] = @EMPTY_SQUARE
      end

      # render board
      render
    rescue  NoMethodError => _
      puts "\n\"(INVALID COORDINATES, TRY AGAIN!\")"
      puts
      render
    rescue  TypeError => _
      puts "\n\"(INVALID COORDINATES, TRY AGAIN!\")"
      puts
      render
    end


    # change turn
      # take the curr ascii representation
      # create a nested for loop
      # check every position
      # if the ascii is similar to a piece of the same type (then invalid movement, except knight)
  end

  private
  def is_valid_movement?(curr_y, curr_x, new_y, new_x)
    # (plano y)
    # 8
    # 7
    # -------
    # (plano x) ->   a b c

    # pawn (first movement) (move)
    # [
    #  up:curr "up 2 rows in same position"
    #  up:curr
    #  (attack) [up:curr-1][up:curr+1] (if the square is not empty)
    # ]
    if @piece.ascii.eql?(W_PAWN)
      # board[y][x]
      if @board[curr_y]
    end
    true
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

# definir regla de movimiento en codigo
  # rook -> (a1, a8) (b1, b8) (c1, c8) (d1, d8) (e1, e8) (f1, f8) (g1, g8) (h1, h8)
  # to detect up or down "use the curr coord in the upper/lower row"
  # to detect left or right "use the curr coord and add/substract 1"
  # to check if the given coords are valid "calc square distance between the given coords"
  # to eat the piece "check the color of it"

# rook
  # [
  #  up:curr(up row),
  #  down:curr(down row),
  #  left:curr-1,
  #  right:curr+1
  # ]
# pawn (first movement) (move)
  # [
  #  up:curr "up 2 rows in same position"
  #  up:curr
  #  (attack) [up:curr-1][up:curr+1] (if the square is not empty)
  # ]
# queen, king
  # [
  #  up:curr
  #  down:curr
  #  left:curr-1
  #  right:curr+2
  #
  #  up-left-diagonal:curr-1
  #  up-right-diagonal:curr+1
  #
  #  down-left-diagonal:curr-1
  #  down-right-diagonal:curr+1
  # ]
# knight
  # [
  #  up-left:curr(up 2 rows) -> curr-1
  #  up-right:curr(up 2 rows) -> curr+1
  #
  #  down-left:curr(up 2 rows) -> curr-1
  #  down-right:curr(up 2 rows) -> curr+1
  # ]
# bishop
  # [
  #  up-left: curr(selected row up)-1
  #  up-right: curr(selected row up)+1
  #  down-left: curr(selected row down)-1
  #  down-right: curr(selected row down)+1
  # ]
