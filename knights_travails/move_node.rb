class MoveNode
  attr_accessor :parent_space, :space, :child_spaces

  def initialize(parent, current)
    @parent_space = parent
    @space = current
    @child_spaces = []

  end


end

