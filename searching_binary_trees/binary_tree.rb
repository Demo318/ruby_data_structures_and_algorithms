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

def build_tree(data)
  # 


end