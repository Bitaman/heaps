

# This method uses a heap to sort an array.
# Time Complexity:  ?
# Space Complexity: ?
def heapsort(list)
  return list if list.length == 0 || list.length == 1

  #create new instance of MinHeap
  min_heap = MinHeap.new

  #add all the elements from list
  list.each do |element|
    min_heap.add(element, value = element)
  end

  #remove and add to result
  result = []
  list.length.times do
    result << min_heap.remove
  end
  return result
end