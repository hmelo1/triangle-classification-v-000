class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3
  @@sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @@sides << [side1, side2, side3]
  end

  def kind
    validate_triangle
    return :equilateral if @@sides[0] == @@sides[2]
    return :isosceles if @@sides[0] == @@sides[1] or @@sides[1] == @@sides[2]
    return :scalene
  end

  def validate_triangle
    #place all the sides into an array and sort the array
    @@sides.sort
    #raise the error if the lowest # is less than or equal to 0 or if the 2
    #lesser sides are less than or equal to the biggest side
    raise TriangleError if @@sides[0] <= 0 or @@sides[0] + @@sides[1] <= @@sides[2]
  end
end

class TriangleError < StandardError
  def message
    "Illegal"
  end
end
