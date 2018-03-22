##
# from The Odin Project challenges

require_relative 'move_node.rb'
require_relative 'board.rb'
require_relative 'board_space.rb'
require_relative 'knight.rb'

my_board = Board.new
my_board.generate_board
my_knight = Knight.new(my_board.find_space([4, 4]), my_board)
my_moves_tree = MovesTree.new(my_knight)
my_moves_tree.build_tree
my_moves_tree.change_root([5, 2])
p my_moves_tree.provide_route([3, 1])

my_moves_tree.change_root([7, 7])
p my_moves_tree.provide_route([0, 5])
