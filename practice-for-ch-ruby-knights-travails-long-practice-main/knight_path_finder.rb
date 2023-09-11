require_relative "tree_node"
require "byebug"

class KnightPathFinder

    attr_reader :considered_positions

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
        @considered_positions += selected_pos
        selected_pos
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            ele = queue.shift
            new_move_positions(ele.value).each do |position_pair|
                child_node = PolyTreeNode.new(position_pair)
                child_node.parent = ele
                queue += [child_node]
            end 
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

    def find_path(end_pos)
      @end_node = @root_node.bfs(end_pos)
    end 

    def trace_path_back
        new_array = [@end_node.value]


        until @end_node.parent == nil
        new_array << @end_node.parent.value
        @end_node = @end_node.parent
        end
        
        new_array.reverse 
    end 





end 


a = KnightPathFinder.new([0,0])
a.build_move_tree
# puts a.considered_positions.length
# print a.considered_positions

a.find_path([7,6])

p a.trace_path_back
