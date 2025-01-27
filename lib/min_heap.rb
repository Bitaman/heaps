class HeapNode
  attr_reader :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

class MinHeap

  def initialize
    @store = []
  end

  # This method adds a HeapNode instance to the heap
  # Time Complexity: ?
  # Space Complexity: ?
  def add(key, value = key)
    new_node = HeapNode.new(key, value)
    new_node_index = @store.length
    @store.push(new_node)
    if new_node_index > 1
      heap_up((@store.length - 1))
    end
  end

  # This method removes and returns an element from the heap
  #   maintaining the heap structure
  # Time Complexity: ?
  # Space Complexity: ?
  def remove()
    swap(0, @store.length - 1)
    answer = @store.pop
    heap_down(0)
    return answer.value
  end


  # Used for Testing
  def to_s
    return "[]" if @store.empty?

    output = "["
    (@store.length - 1).times do |index|
      output += @store[index].value + ", "
    end

    output += @store.last.value + "]"
      
    return output
  end

  # This method returns true if the heap is empty
  # Time complexity: ?
  # Space complexity: ?
  def empty?
    raise NotImplementedError, "Method not implemented yet..."
    return true if @store == []
  end

  private

  # def find_parent(index)
  #   parent_index = (index - 1)/2
  #   return parent_index
  # end

  # This helper method takes an index and
  #  moves it up the heap, if it is less than it's parent node.
  #  It could be **very** helpful for the add method.
  # Time complexity: ?
  # Space complexity: ?
  def heap_up(index)
    return if index == 0
    parent_index = (index - 1) / 2
    return if @store[parent_index].key < @store[index].key
    swap(index, parent_index)
    heap_up(parent_index)
    
  end

  # This helper method takes an index and 
  #  moves it up the heap if it's smaller
  #  than it's parent node.
  def heap_down(index)
    # raise NotImplementedError, "Method not implemented yet..."
    left_child = index * 2 + 1
    right_child = index * 2 + 2
    if @store[left_child] == nil #at bottom of tree
      return
    end
    if @store[right_child] == nil
      if @store[index] > @store[left_child]
        swap(index, left_child)
      end
      return
    end

    if @store[left_child].key < @store[right_child].key
      swap(left_child, index)
      heap_down(left_child)
    else
      swap(right_child, index)
      heap_down(right_child)
    end
  end

  # If you want a swap method... you're welcome
  def swap(index_1, index_2)
    temp = @store[index_1]
    @store[index_1] = @store[index_2]
    @store[index_2] = temp
  end
end