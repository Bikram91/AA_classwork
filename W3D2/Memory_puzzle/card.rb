class Card
    CHARACTERS = ("A".."H").to_a

    attr_reader :face_value
    def initialize(face_value, face = false)
        @face_value = face_value
        @previous_guess
        @face
    end

    def hide?
        @face = false
    end

    def reveal?
        @face = true
    end

    def previous_guess
        @face_value
    end

    def to_s
        if @face
            @face_value.to_s
        else
            " "
        end
    end

    def ==(other_card)
        other_card.value == @face_value
    end

    
    def check_for_match(humanplayer)
       idx = humanplayer.get_position
       @face_value == @board.[idx]
    end
end






