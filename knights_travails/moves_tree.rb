require_relative 'move_node.rb'
require_relative 'knight.rb'


class MovesTree

  attr_accessor :root_node, :route

  def initialize(knight)
    @knight = knight
    @board = knight.board
    @route = []
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
      node.child_nodes << new_node
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

  def change_root(coords)
    # Rebuilt MovesTree based on new Coordinates

    @knight.new_space(@knight.board.find_space(coords))
    build_tree
    @root_node
  end

  def find_dest(coords, node = @root_node, this_path = [])
    puts "finding dest"
    p node.space.coordinates

    this_path << node.space.coordinates

    if this_path[-1] == coords
      @route = this_path
      return
    end
    
    unless node.child_nodes.empty?
      node.child_nodes.each do |this_node|
        find_dest(coords, this_node, this_path)
      end
    end

    @route
  end

end