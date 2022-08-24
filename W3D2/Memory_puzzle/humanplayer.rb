class Humanplayer
    def initialize
        
    end
    
    def get_position
        p "Enter the position of card you'd like to flip"
        position = gets.chomp.split(",").map(&:to_i)

        raise "Invalid position" if position.length != 2 
    end

  

end