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
  'x': 2,
  'y': 6,
  # width and height
  'w': 10,
  'h': 4,
}

b = {
  # (x,y) originating in the top-left
  'x': 1,
  'y': 5,
  # width and height
  'w': 10,
  'h': 4,
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
    p inter[:w] <= 0 || inter[:h] <= 0 ? "They don't intersect" : inter
end

findIntersect(a, b)
