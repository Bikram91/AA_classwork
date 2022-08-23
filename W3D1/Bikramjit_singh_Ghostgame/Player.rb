class Player

  def initialize(name)
    @name = name
  end

  def guess
    puts "Enter a letter: "
    letter = gets.chomp
  end

  def alert_invalid_guess
    alpha = "abcdefghijklmnopqrstuvwxyz"
    raise "Invalid" if !alpha.include?(guess.downcase)
    # raise "Invalid" if #dictionary.any? {|ele| ele.include}
  end
end
