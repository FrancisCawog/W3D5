require_relative "tree_node"
require "byebug"

class KnightPathFinder

    def initialize(start_position)
        @root_node = PolyTreeNode.new(start_position) 
        @considered_positions = [start_position]
    end

    def self.valid_moves?(pos)
        moves = [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
        new_arr = []
        moves.each do |move|
            new_arr << [pos[0] + move[0], pos[1] + move[1]]
        end
        new_arr.select {|pos| (pos[0] >= 0 && pos[0] <= 7) && (pos[1] >= 0 && pos[1] <= 7)}
    end 

    def new_move_positions(pos)
        array = KnightPathFinder.valid_moves?(pos)
        selected_pos = array.select{|pos| !@considered_positions.include?(pos)}
        @considered_positions << selected_pos
        selected_pos
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            ele = queue.shift
            queue += PolyTreeNode.new(new_move_positions(ele))
        end
        return nil 
    end 

    def [](pos)
        row, col = pos
        self[row][col]
    end 

    def []=(pos, val)
        row, col = pos
        self[row][col] = val
    end 
end 


puts a = KnightPathFinder.new([0,0])
puts a.build_move_tree([3, 3])