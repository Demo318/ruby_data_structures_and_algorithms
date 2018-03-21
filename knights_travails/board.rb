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

  def find_all_spaces
    # returns array of all spaces from the board.

    space = @root_space
    all_spaces = []
    loop do
      all_spaces << space
      break if space.coordinates == [@max_x, @max_y]
      unless space.adjacent_spaces['right'].nil?
        space = space.adjacent_spaces['right']
      else
        space = find_space([0, space.coordinates[1] + 1])
      end
    end
    all_spaces
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