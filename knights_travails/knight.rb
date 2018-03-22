require_relative 'moves_tree.rb'

# Represents knight piece on chess board.
class Knight
  attr_accessor :possible_moves, :current_space, :board

  def initialize(starting_space, board)
    @current_space = starting_space
    @board = board
    @possible_moves = get_spaces(@current_space)
  end

  def new_space(space)
    @current_space = space
    @possible_moves = get_spaces(@current_space)
  end

  def get_spaces(starting_space)
    moves = []
    possible_directions = [['up', 'left'],
                           ['up', 'right'],
                           ['right', 'up'],
                           ['right', 'down'],
                           ['down', 'right'],
                           ['down', 'left'],
                           ['left', 'down'],
                           ['left', 'up']]

    possible_directions.each do |directs|
      destination_space = move_knight(directs, starting_space)
      moves << destination_space unless destination_space.nil?
    end 
    moves
  end

  def move_knight(direction, this_space)
    2.times do
      return nil if this_space.adjacent_spaces[direction[0]].nil?
      this_space = this_space.adjacent_spaces[direction[0]]
    end

    return nil if this_space.adjacent_spaces[direction[1]].nil?
    this_space.adjacent_spaces[direction[1]]
  end
end