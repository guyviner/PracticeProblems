# 2. Given a Linked List:

class LinkedList
  attr_accessor :head

  def initialize (head)
    raise "LinkedList must be initialized with a Node." unless head.is_a?(Node)
    @head = head
  end

  def insert (node)
    runner = @head
    while runner.next != nil
      runner = runner.next
    end
    runner.next = node
  end

end

# With each Node formatted as such:

class Node

  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

end

# Task:Delete a node from the singly linked list given only a variable pointing to that node.

def deleteLinkedlistNode(node)
  nextnode = node.next
  if node && nextnode
    node.next = nextnode.next
    node.value = nextnode.value
  end
end
