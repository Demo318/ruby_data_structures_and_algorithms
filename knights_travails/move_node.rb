class MoveNode
  attr_accessor :parent_node, :space, :child_nodes

  def initialize(parent, current)
    @parent_node = parent
    @space = current
    @child_nodes = []

  end


end
