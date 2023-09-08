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

  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result if search_result != nil
    end
    return nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      ele = queue.shift
      return ele if ele.value == target_value
      queue += ele.children
    end
    return nil 
  end
end