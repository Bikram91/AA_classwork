require_relative "Player"


class Game

    attr_reader :current_player, :players

    def initialize(*names)
      @players = names.each {|name| Player.new(name)}
      @fragment = ""
      words = File.readlines("diction.txt")
      words.map! {|ele| ele.chomp}
      @dictionary = Set.new(words)
      @current_player = @players[0]
      @previous_player = "No one has gone yet"
    end

    def previous_player
        @previous_player = @players[-1]
    end

    def next_player!
        @players.rotate 
        current_player = @players[0]
        previous_player
    end

end

game1 = Game.new("Bob", "Mary", "Joe")