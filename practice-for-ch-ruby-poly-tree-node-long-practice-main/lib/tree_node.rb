class PolyTreeNode
    attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if @parent != nil
      @parent.children.delete(self)
    end
    @parent = node 
    if @parent != nil
      @parent.children << self
    end
  end


end