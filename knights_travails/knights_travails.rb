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

  def get_coords(space)
    return space.coordinates unless space.nil?
    nil
  end

  def to_s

    "#{@coordinates} | UP: #{get_coords(@adjacent_spaces['up'])} RIGHT: #{get_coords(@adjacent_spaces['right'])} DOWN: #{get_coords(@adjacent_spaces['down'])} LEFT: #{get_coords(@adjacent_spaces['left'])}"

  end
end


# An instance of Board contains enough BoardSpace objects
# to create the entire play-surface of the chess board.
class Board
  attr_accessor :root_space, :current_space

  def initialize()
    # Generates linked board spaces.
    # Returns space at coords 0, 0

    @max_x = 7
    @max_y = 7
    @root_space = BoardSpace.new([0, 0])
    @player_space = nil
  end

  def find_space(coords)
    # Locates space containing player-provided coordinates.
    # coords = [0,0]

    first_row_space = @root_space
    this_space = first_row_space

    loop do
      return this_space if this_space.coordinates == coords
      break if this_space.coordinates == [@max_x, @max_y]

      if this_space.adjacent_spaces['right'].nil? == false
        this_space = this_space.adjacent_spaces['right']
      else
        this_space = first_row_space.adjacent_spaces['up']
        first_row_space = this_space
      end

    end
    false
  end

  def generate_board
    # creates blank game board

    current_root = @root_space
    prev_root = nil

    loop do
      create_row(current_root)
      link_row(current_root, prev_root) unless prev_root.nil?
      break unless current_root.coordinates[1] < @max_y
      current_root.adjacent_spaces['up'] = BoardSpace.new([current_root.coordinates[0],
                                                           current_root.coordinates[1] + 1])
      prev_root = current_root
      current_root = current_root.adjacent_spaces['up']
    end
    self
  end

  def link_row(top_space, bottom_space)
    # links relationships vertically between spaces, giving each an

    first_space = top_space

    loop do
      top_space.adjacent_spaces['down'] = bottom_space
      bottom_space.adjacent_spaces['up'] = top_space
      top_space = top_space.adjacent_spaces['right']
      bottom_space = bottom_space.adjacent_spaces['right']
      break if top_space.nil?
    end

    first_space
  end

  def create_row(space)
    # Creates a row of of BoardSpace objects, with 'right' and 'left' relations

    this_space = space
    loop do
      new_space = BoardSpace.new([this_space.coordinates[0] + 1,
                                  this_space.coordinates[1]])
      this_space.adjacent_spaces['right'] = new_space
      new_space.adjacent_spaces['left'] = this_space
      this_space = new_space
      break if this_space.coordinates[0] == @max_x
    end
    space
  end
end

# Builds a tree of all possible moves for a given type of piece.
# Includes restriction on how large the board can be (8x8)
class BestRoute
  attr_reader :start_space
  attr_accessor :board

  def initialize()
    # Creates tree of related BoardSpaces.
    # Initialize board.player_space to 0,0

    @board = Board.new
    @board.generate_board

    pick_start([0, 0])

  end

  def pick_start(start_coords)
    # User sets where his knight piece goes.
    # Returns true if set

    @start_space = @board.find_space(start_coords)
    @start_space.to_s
  end

  def find_route(this_space, end_coords, spaces = [])
    # Finds route from @start_coords to end_coord
    # Returns human-readable list of moves.
    spaces << this_space.to_s
    return spaces if this_space.coordinates == end_coords


  end

  def move_up_left(this_space, end_coords, spaces)
    this_space = this_space.adjacent_spaces['up'].adjacent_spaces['up'].adjacent_spaces['left']

  end
end

this_route = BestRoute.new

puts "Location 2,2 is #{this_route.board.find_space([2, 2])}."
puts "UpLeft Move #{this_route.board.find_space([2, 2]).adjacent_spaces['up'].adjacent_spaces['up'].adjacent_spaces['left'].to_s}"
