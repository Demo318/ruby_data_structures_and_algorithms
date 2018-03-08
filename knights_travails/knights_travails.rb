##
# from The Odin Project challenges

# Has own coordinates
# Has variables containing references to all board_spaces knight can move to.
class BoardSpace
  def initialize(coordinates)
    # Takes coordinates.
    # Sets related BoardSpaces to nil
    @coordinates = coordinates
    @moves = { ul => nil,
               ur => nil,
               ru => nil,
               rd => nil,
               dr => nil,
               dl => nil,
               ld => nil,
               lu => nil }
  end
end

# Builds a tree of all possible moves for a given type of piece.
# Includes restriction on how large the board can be (8x8)
class BestRoute
  def initialize()
    # Creates tree of related BoardSpaces.
    @max_x = 7
    @max_y = 7

    @start_space = BoardSpace.new([0,0])
  end

  def pick_start(start_coords)
    # User sets where his knight piece goes.
    # Returns true if set

    @start_coord = start_coords
  end

  def find_route(end_coord)
    # Finds route from @start_coords to end_coord
    # Returns human-readable list of moves.
  end
end
