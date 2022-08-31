class Piece
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    #when printing out the board print k for k
    def to_s
    end

    def empty?
        self.nil?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
        raise "method not implemented"
    end

    private
    def move_into_check?(end_pos)
    end

end