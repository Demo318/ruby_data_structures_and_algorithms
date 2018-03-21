require_relative 'move_node.rb'

class KnightMovesTree

  def initialize(board, knight)
    # Build a tree of moves based on the knights current position.
    
    @board = board
    get_all_spaces

    
    # TODO: Identify the Knight's current position as the root node of the tree.
    # TODO: Remove node from all_possible_spaces arr
    # TODO: Identify all of the spaces the knight could move to
    # TODO: Create child nodes for each move, if the node is on the 'find_all_spaces' array.
    # TODO: Remove nodes from all_possible_spaces

  end

  def get_all_spaces
    @all_possible_spaces = @board.find_all_spaces
  end

end