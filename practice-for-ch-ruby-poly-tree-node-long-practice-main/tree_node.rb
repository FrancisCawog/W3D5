class PolyTreeNode
    attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    self.parent = @parent
  end


end