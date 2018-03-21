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