module Pieces

  private
  class BasePiece
    attr_accessor :color, :ascii, :valid_distance
    def initialize(player_color, ascii, valid_distance)
      @player_color = player_color
      @ascii = ascii
      @valid_distance = valid_distance
    end
  end

  # peones
  public
  class Pawn < BasePiece
      def initialize(player_color, ascii, valid_distance)
          super(player_color, ascii, valid_distance)
      end

  end

  # alfil
  class Bishop < BasePiece
      def initialize(player_color, ascii, valid_distance)
          super(player_color, ascii, valid_distance)
      end
  end

  # caballero
  class Knight < BasePiece
    def initialize(player_color, ascii, valid_distance)
      super(player_color, ascii, valid_distance)
    end
  end

  # torre
  class Rook < BasePiece
    def initialize(player_color, ascii, valid_distance)
      super(player_color, ascii, valid_distance)
    end
  end

  # reina
  class Queen < BasePiece
    def initialize(player_color, ascii, valid_distance)
      super(player_color, ascii, valid_distance)
    end
  end

  # rey
  class King < BasePiece
    def initialize(player_color, ascii, valid_distance)
      super(player_color, ascii, valid_distance)
    end
  end
end
