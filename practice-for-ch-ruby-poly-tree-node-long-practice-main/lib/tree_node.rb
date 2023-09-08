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


  def add_child(child_node)
    child_node.parent = self
  end 

  def remove_child(child_node)
    if child_node.parent == nil 
      raise "error" 
    end
    child_node.parent = nil
  end 

  






end