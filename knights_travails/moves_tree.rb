require_relative 'move_node.rb'

class MovesTree

  attr_accessor :root_node
  
  def initialize(knight)
    @knight = knight
    @board = knight.board
  end

  def build_tree

    get_all_spaces

    # Identify the Knight's current position as the root node of the tree.
    @root_node = MoveNode.new(nil, @knight.current_space)
    remove_possible_space(@root_node)

    add_all_child_spaces(@root_node, @knight)



  end

  def add_all_child_spaces(node, knight)
    return if @all_possible_spaces.empty?
    next_moves = knight.get_spaces(node.space)
    next_moves.delete_if { |spc| @all_possible_spaces.include?(spc) == false }
    @all_possible_spaces.delete_if { |spc| next_moves.include?(spc) }
    next_moves.each do |nxtmv|
      new_node = MoveNode.new(node, nxtmv)
      node.child_spaces << new_node
      add_all_child_spaces(new_node, knight)
    end
  end

  def remove_possible_space(node)
    # Takes a node from the tree and removes it from @all_possible_spaces
    # to ensure duplicate nodes are avoided.

    @all_possible_spaces - [node.space]
  end

  def get_all_spaces
    @all_possible_spaces = @board.find_all_spaces
    puts "all spaces found"
  end

end