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
    puts "#{@value} at #{object_id}"
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

  node = node.parent until node.parent.nil?
  node
end

def breadth_first_search(target, root_node)
  # Classice breadth-first-search algorithm
  # Returns node object containing target

  current_level_nodes = [root_node]

  loop do

    current_level_nodes.each do |node|
      return node if node.value == target
    end

    current_level_nodes = find_next_level_nodes(current_level_nodes)
    break if current_level_nodes.empty?
  end
  nil
end

def find_next_level_nodes(current_level)
  # Returns array of Node objects that are children of Nodes in current_level

  next_level = []
  current_level.each do |node|
    next_level.append(node.left_child) unless node.left_child.nil?
    next_level.append(node.right_child) unless node.right_child.nil?
  end
  next_level
end

# TODO: Write a depth_first_search that isn't recursive.

def depth_first_search_recursive(target, node)
  # in-order depth-first-search done recursively.

  depth_first_search_recursive(target, node.left_child) unless node.left_child.nil?
  return node if node.value == target
  depth_first_search_recursive(target, node.right_child) unless node.right_child.nil?
end

tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])

puts breadth_first_search(23, tree)
puts breadth_first_search(1, tree)
puts breadth_first_search(6345, tree)
puts breadth_first_search(66, tree)

puts 'Depth first recursive'

puts depth_first_search_recursive(23, tree)
puts depth_first_search_recursive(1, tree)
puts depth_first_search_recursive(6345, tree)
puts depth_first_search_recursive(66, tree)
