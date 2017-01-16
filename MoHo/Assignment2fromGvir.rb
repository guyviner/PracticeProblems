# 1. Write a function that prints out all integers between 0 and n that fit one of these three criteria:
#
# a) i is divisible by 3
# b) i is divisible by 5
# c) i is divisible by 3 and 5
#
# For example, if (n) is 15 the output would be:
#
# 3 is divisible by 3
# 5 is divisible by 5
# 6 is divisible by 3
# 9 is divisible by 3
# 10 is divisible by 5
# 12 is divisible by 3
# 15 is divisible by 3 and 5

def divisibles(n)
  for i in 1..n
    if i % 15 == 0
      puts "#{i} is divisible by 3 and 5"
    elsif i % 5 == 0
      puts "#{i} is divisible by 5"
    elsif i % 3 == 0
      puts "#{i} is divisible by 3"
    end
  end
end

# divisibles(30)

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

  # def delete(node)
  #   runner = @head
  #   if runner == node
  #     @head = runner.next
  #   else
  #     while runner.next != node && runner.next != nil
  #       runner = runner.next
  #     end
  #     if runner.next == node
  #       runner.next = runner.next.next
  #     end
  #   end

  # end
end

# With each Node formatted as such:

class Node

  attr_accessor :value, :next

  def initialize(value)
    @value = value
  end

end


a = Node.new(1)
b = Node.new(2)
c = Node.new(3)
d = Node.new(4)
e = Node.new(5)
f = Node.new(6)
a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
# Task:Delete a node from the singly linked list given only a variable pointing to that node.

# Please see the method that I wrote above as part of the LinkedList class to delete a node

#
# 3. Write an algorithm that determines the intersection of two rectangles. A rectangle is defined as the following dictionary:

# {
#   # (x,y) originating in the top-left
#   'x': 1,
#   'y': 5,
#   # width and height
#   'w': 10,
#   'h': 4,
# }

a = {
  # (x,y) originating in the top-left
  'x': 0,
  'y': 1,
  # width and height
  'w': 2,
  'h': 1,
}

b = {
  # (x,y) originating in the top-left
  'x': 1,
  'y': 0,
  # width and height
  'w': 2,
  'h': 2,
}

def findIntersect(a, b)
    rightRect = a[:x] > b[:x] ? a : b
    leftRect = rightRect == a ? b : a
    topRect = a[:y] > b[:y] ? a : b
    bottomRect = topRect == a ? b : a
    wTemp = leftRect[:x] + leftRect[:w] - rightRect[:x]
    hTemp = bottomRect[:y] + bottomRect[:h] - topRect[:y]
    inter = {
            x: rightRect[:x],
            y: topRect[:y],
            w: wTemp < rightRect[:w] ? wTemp : rightRect[:w],
            h: hTemp < topRect[:h] ? hTemp : topRect[:h]
            }
    inter[:w] <= 0 || inter[:h] <= 0 ? "They don't intersect" : inter
end
# I got confused about the y axis direction
findIntersect(a, b)
