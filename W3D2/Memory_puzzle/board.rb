require_relative "card"

class Board
  attr_reader :size

  CHARACTERS = ("A".."H").to_a

  def initialize(size)
    @size = size
    @grid = Array.new(size) { Array.new(size) }
  end

  def [](pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col]
  end

  def []=(pos, val)
    row = pos[0]
    col = pos[1]
    @grid[row][col] = val
  end

  def place_random_chars
    total_chars = 0.5 * @size
    char_count = 0
  end

  # def populate(grid)
  #     total_chars = CHARACTERS.length
  #     count = Hash.new(0)
  #     # row = rand(total_chars)
  #     # col = rand(total_chars)
  #     grid.each do |subgrid|
  #         subgrid.each do |el|
  #             if count[el] < 2
  #                 el = CHARACTERS.sample
  #                 count[el] += 1
  #             end
  #         end
  #     end
  #     return grid
  # end

  # def populate
  #     range = (0..4 - 1).to_a
  #     total_chars = CHARACTERS
  #     (0...@grid.length).each do |i1|
  #         (0...@grid.length).each do |i2|
  #             if @grid[i1][i2] == nil
  #             @grid[i1][i2] = CHARACTERS.sample
  #                 @grid[range.sample][range.sample] = @grid[i1][i2]
  #             end
  #         end
  #     end
  # end

  def populate(grid)
    i = 0
    while i < grid.length
      j = 0
      while j < @grid[0].length
        random_ele = CHARACTERS.sample
        grid[i][j] = random_ele
        grid[i][j + 1] = random_ele
        j += 2
      end
      i += 1
    end
    flatten = grid.flatten.shuffle

    flatten.each do |ele|
      arr = []
      i = 0
      while i < size
        i += 1
      end
    end
  end

  def render
    @grid.each do |row|
      p row.join(" ")
    end
  end

  def won?
    card = Card.new(face_value)
    @grid.flatten.all?(card.reveal)
  end
end
