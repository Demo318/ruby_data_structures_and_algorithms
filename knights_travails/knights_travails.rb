##
# from The Odin Project challenges

require_relative 'move_node.rb'
require_relative 'board.rb'
require_relative 'board_space.rb'
require_relative 'knight.rb'


# Builds a tree of all possible moves for a given type of piece.
# Includes restriction on how large the board can be (8x8)
class BestRoute
  attr_reader :start_space
  attr_accessor :board, :piece

  def initialize()
    # Creates tree of related BoardSpaces.
    # Initialize board.player_space to 0,0

    @board = Board.new
    @board.generate_board

    @piece = Knight.new(@board.find_space([4, 4]), @board)

  end

  def pick_start(start_coords)
    # User sets where his knight piece goes.
    # Returns true if set

    @piece.new_space(@board.find_space(start_coords))
    @piece
  end

  def find_route()
    nil
  end
end

my_board = Board.new
my_board.generate_board
puts "Board Built"
my_knight = Knight.new(my_board.find_space([4, 4]), my_board)
puts "You have a knight"
my_moves_tree = MovesTree.new(my_knight)
puts "Initialized moves tree"
my_moves_tree.build_tree
puts "tree built"
puts my_moves_tree.root_node

