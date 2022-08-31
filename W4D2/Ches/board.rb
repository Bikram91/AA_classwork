require_relative "piece"
class Board

    PIECES = ["-R", "-Kn", "-B" , "-K", "-Q", "-B", "-Kn", "-R"]
    WPIECES = ["+R", "+Kn", "+B" , "+K", "+Q", "+B", "+Kn", "+R"]
    PAWNS = ["-P", "-P", "-P", "-P", "-P", "-P", "-P", "-P"]
    WPAWNS =["+P", "+P", "+P", "+P", "+P", "+P", "+P", "+P"]

    def initialize
        @rows = Array.new(8){Array.new(8)}
        set_up_board(@rows)
    end

    def set_up_board(board)
       board.each_with_index do |row, index|
            if index == 0
                row.replace(PIECES)
            elsif index == 1
                row.replace(PAWNS)
            elsif index == 6
                row.replace(WPAWNS)
            elsif index == 7
                row.replace(WPIECES)
            end
        end
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, value)
        x, y = pos
        @rows[x][y] = value
    end

    def move_piece(start_pos, end_pos)
        piece = self[start_pos]

        if !(0..7).include?(start_pos[0]) || !(0..7).include?(start_pos[1])
            raise "Not valid start position"
        end

        if !(0..7).include?(end_pos[0]) || !(0..7).include?(end_pos[1])
            raise "Not valid end position"
        end

        unless piece == nil
            self[start_pos] = nil
            self[end_pos] = piece
        else
            raise "Starting position is empty"
        end

        #the piece cannot move to end_pos -> no valid_move?
        
    end


end

