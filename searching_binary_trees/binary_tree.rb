##
# Requirements for project found on
# https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms

class Node
  attr_accessor :parent, :left_child, :right_child, :value

  def initialize(value)
    # New node initializes with value only. Related nodes are nil.

    @parent = nil
    @left_child = nil
    @right_child = nil
    @value = value
  end
end

def build_tree(data, parent_node = nil)
  # Takes in array of values, recursively creates binary tree.
  # Returns first node, which anchors to the rest of the tree.

  this_value = data.shift
  this_node = Node.new(this_value)
  this_node.parent = parent_node

  return if data.empty?

  if this_value <= data[0]
    this_node.left_child = build_tree(data, this_node)
  else
    this_node.right_child = build_tree(data, this_node)
  end

  this_node
end



tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree
