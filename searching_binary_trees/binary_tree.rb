##
# Requirements for project found on
# https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms

class Node
  attr_accessor :parent, :left_child, :right_child, :value

  def initialize(value, parent = nil, left_child = nil, right_child = nil)
    # New node initializes with value only. Related nodes are nil.

    @parent = parent
    @left_child = left_child
    @right_child = right_child
    @value = value
  end

  def to_s
    value.to_s
  end
end

def build_tree(data)
  # Takes in array of values, recursively creates binary tree.
  # Returns first node, which anchors to the rest of the tree.

  this_value = data.shift
  root_node = Node.new(this_value)

  while data.empty? == false
    this_value = data.shift
    add_node(this_value, root_node)

  end

  root_node
end

def add_node(value, node)
  # Compares down the binary tree to find best position for
  # passed value.

  if value <= node.value
    if node.left_child.nil?
      node.left_child = Node.new(value, node)
    else
      go_to_left_child(value, node)
    end
  else
    go_to_right_child(value, node)
  end
end

def go_to_right_child(value, node)
  if node.right_child.nil?
    node.right_child = Node.new(value, node)
  else
    add_node(value, node.right_child)
  end
end

def go_to_left_child(value, node)
  if value > node.left_child.value
    bump_left_child(value, node)
  else
    add_node(value, node.left_child)
  end
end

def bump_left_child(new_value, current_node)
  # Creates new left_child node using new_value
  # Assigns relationships to take the place of current_node.left_child
  # The bumped node keeps all dependencies

  old_left_child = current_node.left_child
  new_left_child = Node.new(new_value, current_node, old_left_child)

  current_node.left_child = new_left_child
  old_left_child.parent = new_left_child

  new_left_child
end

def find_root_node(node)
  # Climbs up tree to find node that has no parent.

  node = node.parent while node.parent.nil? == false
  node
end

def breadth_first_search(binary_tree)
  # Classice breadth-first-search algorithm

end


tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree
 