##
# from The Odin Project challenges

require_relative 'move_node.rb'
require_relative 'board.rb'
require_relative 'board_space.rb'
require_relative 'knight.rb'

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

