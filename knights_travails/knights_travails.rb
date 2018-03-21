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

this_route = BestRoute.new
puts "Location 2, 2 is #{this_route.board.find_space([2, 2])}."
puts "Location 0, 0 is #{this_route.board.find_space([0, 0])}."
puts this_route.board.find_all_spaces