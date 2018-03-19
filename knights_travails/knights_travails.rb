##
# from The Odin Project challenges

# Has own coordinates
# Has variables containing references to all board_spaces knight can move to.
class BoardSpace
  attr_accessor :coordinates, :adjacent_spaces

  def initialize(coordinates)
    # Takes coordinates as array of two integers, ex. [2, 4].
    # Sets related BoardSpaces to nil
    @coordinates = coordinates
    @adjacent_spaces = { 'up' => nil, 'right' => nil, 'down' => nil, 'left' => nil }
  end
end


# An instance of Board contains enough BoardSpace objects
# to create the entire play-surface of the chess board.
class Board
  def initialize()
    # Generates linked board spaces.
    # Returns space at coords 0, 0

    @max_x = 7
    @max_y = 7
    @root_space = BoardSpace.new([0, 0])
    current_root = @root_space
    prev_root = nil

    until current_root.coordinates[1] == @max_y do
      create_row(current_root)
      link_row(current_root, prev_root) unless prev_root.nil?
      prev_root = current_root
      current_root.adjacent_spaces['up'] = BoardSpace.new([current_root.coordinates[0], current_root.coordinates[1] + 1])
      current_root = current_root.adjacent_spaces['up']
    end

    @root_space
  end

  def link_row(top_space, bottom_space)
    # links relationships vertically between spaces, giving each an 
    first_space = top_space

    until top_space.nil? do
      top_space.adjacent_spaces['down'] = bottom_space
      bottom_space.adjacent_spaces['up'] = top_space
      top_space = top_space.adjacent_spaces['right']
      bottom_space = bottom_space.adjacent_spaces['right']
    end

    first_space
  end

  def create_row(space)
    # Creates a row of of BoardSpace objects, with 'right' and 'left' relations defined

    this_space = space
    until this_space.coordinates[0] == @max_x do
      new_space = BoardSpace.new([this_space.coordinates[0] + 1,
                                  this_space.coordinates[1]])
      this_space.adjacent_spaces['right'] = new_space
      new_space.adjacent_spaces['left'] = this_space
      this_space = new_space
    end

    space
  end
end

# Builds a tree of all possible moves for a given type of piece.
# Includes restriction on how large the board can be (8x8)
class BestRoute

  def initialize()
    # Creates tree of related BoardSpaces.
    nil
  end

  def pick_start(start_coords)
    # User sets where his knight piece goes.
    # Returns true if set

    @start_coord = start_coords
  end

  def find_route(end_coords)
    # Finds route from @start_coords to end_coord
    # Returns human-readable list of moves.
  end
end
