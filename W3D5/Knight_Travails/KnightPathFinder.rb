require_relative "Polytree"
class KnightPathFinder

   attr_reader :considered_pos, :start_pos

     def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @grid = Array.new(8) {Array.new(8)}
        @considered_pos = [@start_pos]
     end
# require "byebug"
     def build_move_tree
      # debugger
         node = [@root_node]
      
         until node.empty?
             current_node = node.shift
             current_position = current_node.value
             new_move_positions(current_position).each do |new_move|

                 new_node = PolyTreeNode.new(new_move)
                 current_node.add_child(new_node)
                 node << new_node
                 
             end
         end
     end

     def self.valid_moves(pos)
      moves = [[2,1], [-2, -1],[-1,-2], [1,2], [1, -2], [2, -1], [-1,2], [-2,1] ]
      valid_coordinates  = []
      moves.each do |subarr|
         row = subarr[0] + pos[0]
         column = subarr[1] + pos[1]
         if row < 8 && column < 8 && row >= 0 && column >= 0
            valid_coordinates << [row, column] 
         end
      end
         valid_coordinates
     end

     def new_move_positions(pos)
      new_move_positions = KnightPathFinder.valid_moves(pos).reject {|subarr| @considered_pos.include?(subarr)}     
         new_move_positions.each do |subarr|
            @considered_pos << subarr
         end
         new_move_positions
     end
     
     def find_path(end_pos)
         self.bfs(end_pos)
      end

      def trace_path_back(end_node)

         array = [end_node]
         

         until array[0] == @root_node
            current_node = array[0]
            array.unshift(current_node.parent) 
         end
         array

      end 

end

# knight = KnightPathFinder.new([2,1])
# p knight.build_move_tree
