class PolyTreeNode
    attr_accessor :value, :children, :parent 
    def initialize(value)
        @value = value
        @children = []
        @parent = nil
    end

    def parent=(node)
        if @parent != nil
            @parent.children.delete(self)
        else 
            self.parent 
        end
        @parent = node
       
        if @parent != nil && !self.parent.children.include?(self)
            self.parent.children << self
        end
    end

    def add_child(child)
        child.parent = self
    end 

    def remove_child(child)
        if self.children.include?(child)
            child.parent = nil
        else
            raise "node is not a child of self"
        end
    end

    def dfs(target)
        return self if self.value == target
        return nil if self.value == nil
        @children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end
        nil
    end 

    def bfs(target)
        queue = []
        queue << self
        until queue.empty?
            current_node = queue.shift
            return  current_node if current_node.value == target
            current_node.children.each do |child|
                queue << child
            end
        end
        nil
    end
end


